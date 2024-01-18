let live_words () = (Gc.quick_stat ()).live_words

let full_major () =
  let words_before = live_words () in
  Gc.full_major ();
  let words_after = live_words () in
  Format.printf "gc.full_major [live_words = %d -> %d, released %d words]\r\n%!"
    words_before words_after
    (words_before - words_after)

let run_miou () =
  Miou.run @@ fun () ->
  let child_count = 200_000 in
  Format.printf "starting %d children [live_words=%d]\r\n%!" child_count
    (live_words ());
  let grandparent =
    Miou.call_cc @@ fun () ->
    (* first nested spawn is the parent *)
    let parent =
      Miou.call_cc @@ fun () ->
      (* the parent will spin up to [child_count] children, which do nothing and instantly terminate *)
      let children =
        List.init child_count (fun id ->
            let cc = Miou.call_cc (fun () -> String.make 1_000 'z') in
            Gc.finalise
              (fun _ -> Format.printf "finalized child %d\r\n%!" id)
              cc;
            cc)
      in
      Format.printf "awaiting all %d children [live_words=%d]\r\n%!"
        (child_count) (live_words ());
      Miou.await_all children |> ignore;
      Miou.yield ();
      full_major ();
      full_major ();
      Format.printf "all %d children have returned [live_words=%d]\r\n%!"
        (child_count) (live_words ())
    in
    Format.printf "awaiting parent [live_words=%d]\r\n%!" (live_words ());
    Miou.await parent |> Result.get_ok |> ignore;
    Format.printf "parent is done [live_words=%d]\r\n%!" (live_words ())
  in
  Miou.await grandparent |> Result.get_ok |> ignore;
  full_major ();
  Format.printf "grandparent is done [live_words=%d]\r\n%!" (live_words ());
  ()

let () =
  Format.printf "before miou\r\n%!";
  run_miou ();
  full_major ();
  (* NOTE(@leostera): this next line needs OCaml 5.2+trunk 
     Gc.compact ()
   *)
  Format.printf "after miou [live_words=%d]\r\n%!" (live_words ());
  Unix.sleep 100
