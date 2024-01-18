# GC + Effects behavior replication

Output:

```
before miou
starting 200000 children [live_words=25796]
awaiting parent [live_words=26008]
awaiting all 200000 children [live_words=36425899]
gc.full_major [live_words = 36426010 -> 36426010, released 0 words]
all 200000 children have returned [live_words=36426010]
finalized child 199999
finalized child 199998
finalized child 199997
(* ... *)
finalized child 2
finalized child 1
finalized child 0
parent is done [live_words=34230544]
gc.full_major [live_words = 25904 -> 25904, released 0 words]
grandparent is done [live_words=25904]
gc.full_major [live_words = 1758 -> 1758, released 0 words]
```
