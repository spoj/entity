# Entity

A single self-reloading loop that makes an AI agent its own long-lived entity.

To set up an entity at the requested path:

1. Copy [`loop.sh`](loop.sh) there.
2. With whoever is setting it up, write `README.md`, the entity's charter: who it is, its objective, and where things live.
3. Run `loop.sh` in the background, e.g. with tmux, a service or a logon task. `AGENT` selects the command, default `pi -p`, and the prompt is appended as its last argument.

The entity keeps its memory as posts in `channel/` ([spoj/posts](https://github.com/spoj/posts)) and communicates through [letmeknow](https://github.com/spoj/letmeknow).

`loop.sh` wakes the agent every 10 minutes and re-reads itself each round, so the entity may change it. Keep credentials and spend caps outside anything it can edit. The script needs a POSIX shell, `timeout` and `realpath`: Linux, WSL or Git Bash.
