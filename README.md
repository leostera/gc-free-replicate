# GC + Effects behavior replication

Output:

```
before miou
starting 200000 children [live_words=0]
awaiting parent [live_words=0]
awaiting all 200000 children [live_words=36360078]
gc.full_major [live_words = 37872233 -> 36426010, released 1446223 words]
all 200000 children have returned [live_words=36426010]
parent is done [live_words=37587396]
finalized child 199999
finalized child 199998
finalized child 199997
(* ... *)c
finalized child 2
finalized child 1
finalized child 0
gc.full_major [live_words = 37587396 -> 34230515, released 3356881 words]
grandparent is done [live_words=34230515]
gc.full_major [live_words = 34230947 -> 1758, released 34229189 words]
```
