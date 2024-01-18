# GC + Effects behavior replication

Output:

```
before miou
starting 200000 children [live_words=0]
awaiting parent [live_words=0]
awaiting all 200000 children [live_words=36396595]
gc.full_major [live_words = 37983216 -> 36426010, released 1557206 words]
all 200000 children have returned [live_words=36426010]
parent is done [live_words=37587396]
finalized child 199999
finalized child 199998
(*...*)
finalized child 1
finalized child 0
gc.full_major [live_words = 37587396 -> 34230521, released 3356875 words]
grandparent is done [live_words=34230521]
gc.full_major [live_words = 34230937 -> 1758, released 34229179 words]
after miou [live_words=1758]
```
