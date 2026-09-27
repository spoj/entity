# Entity

A minimal setup for an AI agent that is its own entity and keeps working over months and years.

Left alone, long-running agents lose track: they rewrite their notes, forget where ideas came from, and pile up state that nobody keeps current. An entity needs only three things to make year-long work possible.

## The model

- **Charter** (`README.md`). Who the entity is, its purpose, and where things live. There is no special owner. Who is who, and whom it answers to for what, follows from its obligations and its history.
- **Obligations** (`OBLIGATIONS.md`). The only state. Every open promise, in or out:
  - what others promised us, and what we promised others;
  - one-off promises, and standing ones such as access granted, licences, scheduled jobs and delegations.

  Each line has a next trigger date and quotes its source. Every entry is a promise to keep it current, so the file stays small.
- **Channel** (`channel/`). The memory: append-only posts that keep evidence at stable addresses, following [spoj/posts](https://github.com/spoj/posts). It grows freely and is searched when needed.

**Aim:** the most useful output per minute of the human attention it uses. People's reading and decisions are the scarce resource; agent time is a budget.

**Loop:** a clock wakes the agent. It is pull-based: each run does three things.

1. Honour the obligations that are due.
2. Register new ones that will outlive the run.
3. Reconcile the register against its sources (mail, systems, the channel) rather than trust it.

Nothing else drives work. The entity's own duties are obligations too, such as "answer mail within a day" or "reconcile this register monthly". People steer it through the promises they make with it. Limits on its actions, such as "draft, don't send", are standing promises to whoever granted the access.

**What to register:**

- **What someone actually promised,** not what we merely rely on. "The server stays up" is an assumption; a licence term or an SLA is a promise.
- **Dependencies that can fail silently:** register our own promise to check them.
- **Whatever is still open when a run ends,** however small. Anything finished within the run is not registered.

**Limits:** each line may carry limits, such as agent time or a person's screens and decisions. Ask before breaking one.

## Set up

To set up an entity at the requested path:

1. Copy [`template/`](template/) there.
2. Create `channel/` there and copy the [spoj/posts README](https://github.com/spoj/posts/blob/main/README.md) into it.
3. Replace the `<...>` fields in `README.md` with whoever is setting it up. Keep the rest. Record what they ask of it, and the access they grant, as obligations.
4. Start `loop.sh` as a long-running background process: tmux, a service, or a logon task. `AGENT` selects the command, default `pi -p`; the prompt is appended as the last argument.
5. Watch the first run. The reconcile line is due immediately; the run should date it forward and register what it finds.

`loop.sh` needs a POSIX shell, `awk`, `timeout` and `realpath`: Linux, WSL or Git Bash. It re-reads itself each round, so the agent may improve it. Keep credentials and spend caps outside anything the agent can edit.

## More than one loop

- **Separate working copies.** Give each loop its own Git worktree, or share one folder and coordinate with [letmeknow](https://github.com/spoj/letmeknow) folder groups.
- **Claims.** A loop claims a line by committing `claimed: <loop> until <time>` and pushing; a rejected push means someone else got it. The claim expires after the line's agent-time limit.
- **Teams.** Each team keeps its own register. The level above derives its view from theirs, cancelling matched in/out pairs between teams, the way group accounts eliminate intercompany balances.

Related ideas: social commitments (Singh and Chopra), The Coordinator (Winograd and Flores), promise theory (Burgess), and Kubernetes' level-triggered reconciliation.
