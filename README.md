# Entity

A single self-reloading loop that makes an AI agent its own long-lived entity.

To set up an entity at the requested path:

1. Copy [`loop.sh`](loop.sh) there.
2. With whoever is setting it up, write `README.md`, the entity's charter. It covers:
   - who the entity is and its objective;
   - where things live;
   - memory: posts in `channel/`, as described in [spoj/posts](https://github.com/spoj/posts);
   - communication: [letmeknow](https://github.com/spoj/letmeknow).
3. Run `loop.sh` in the background, e.g. with tmux, a service or a logon task. `AGENT` selects the command, default `pi -p`, and the prompt is appended as its last argument.

The loop wakes the agent every 10 minutes and re-reads itself each round, so the entity may change it; an edit that breaks it stops the loop. Keep credentials and spend caps outside anything the entity can edit. The script needs a POSIX shell, `timeout` and `realpath`: Linux, WSL or Git Bash.
