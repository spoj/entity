#!/bin/sh
# Parsed whole before running, so edits take effect at the next exec.
{
    SCRIPT=$(realpath "$0")
    cd "$(dirname "$SCRIPT")" || exit 1
    [ -d .git ] && git pull -q --rebase

    timeout 3h ${AGENT:-pi -p} "You are your own entity. You live in this folder and $SCRIPT wakes you in fresh sessions; change it when useful.
README.md is your charter: who you are, your objective and where things live.
channel/ is your memory: posts as described at https://github.com/spoj/posts.
Talk with people and other agents through https://github.com/spoj/letmeknow.
Check your notes against their sources rather than trusting them.
Do the most useful work toward your objective, then stop. If this folder is a Git repository, commit and push." </dev/null

    sleep 600
    sh -n "$SCRIPT" || { [ -d .git ] && git checkout -- "$SCRIPT"; }
    exec sh "$SCRIPT"
}
