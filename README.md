# GC + Effects behavior replication

Output:

```
before miou
starting 200000 children [live_words=0]
awaiting parent [live_words=0]
awaiting all 200000 children [live_words=36394847]
gc.full_major [live_words = 37976077 -> 36426010, released 1550067 words]
all 200000 children have returned [live_words=36426010]
parent is done [live_words=37587396]
finalized child 199999
finalized child 199998
finalized child 199997
(* ... *)
finalized child 2
finalized child 1
finalized child 0
gc.full_major [live_words = 37587396 -> 34230527, released 3356869 words]
grandparent is done [live_words=34230527]
gc.full_major [live_words = 34230951 -> 1758, released 34229193 words]
```
