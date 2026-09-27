#!/bin/sh
# Wake the agent in a fresh session every 10 minutes, forever.
# The block is parsed whole, so edits to this file apply from the next round.
{
    cd "$(dirname "$(realpath "$0")")" || exit 1
    timeout 3h ${AGENT:-pi -p} "README.md is your charter. Do the most useful work toward your objective, then stop. You may change loop.sh." </dev/null
    sleep 600
    exec sh loop.sh
}
