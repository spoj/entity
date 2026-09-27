# Obligations

One line per open promise, starting with its next trigger date (when it is due, or when to chase, review or renew it):

`YYYY-MM-DD · in|out · who · what · limits · source`

- `in`: promised to us. `out`: promised by us. Standing promises (access, licences, jobs, delegations) count.
- `who`: the other party; `self` for the entity's own upkeep.
- `limits`: optional caps on any finite resource, e.g. `agent 1h, $20, Ann 1 screen`.
- `source`: the quoted sentence and a link, or the post that preserves it. Drop a line whose source cannot be found.

When a promise ends (done, cancelled, released or handed on), delete its line; the channel keeps the history. `loop.sh` reads only lines that start with a date, so change the format and its filter together.

2000-01-01 · out · self · reconcile this register against its sources, then date this line forward; never delete it · agent 30m · README.md
