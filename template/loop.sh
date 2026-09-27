#!/bin/sh
# Parsed whole before running, so edits take effect at the next exec.
{
    SCRIPT=$(realpath "$0")
    cd "$(dirname "$SCRIPT")" || exit 1
    [ -d .git ] && git pull -q --rebase

    if ! grep -q '^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] .*reconcile' OBLIGATIONS.md; then
        echo "loop.sh: no dated reconcile line in OBLIGATIONS.md; stopping" >&2
        exit 1
    fi

    due=$(awk -v today="$(date +%F)" '/^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] / && $1 <= today' OBLIGATIONS.md)
    if [ -n "$due" ]; then
        timeout 3h ${AGENT:-pi -p} "Follow README.md. Due now:
$due" </dev/null
    fi

    sleep 600
    sh -n "$SCRIPT" || { [ -d .git ] && git checkout -- "$SCRIPT"; }
    exec sh "$SCRIPT"
}
