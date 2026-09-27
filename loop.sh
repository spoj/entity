#!/bin/sh
{
    cd "$(dirname "$(realpath "$0")")" || exit 1
    timeout 3h ${AGENT:-pi -p} "README.md is your charter. Do the most useful work toward your objective, then stop. You may change loop.sh." </dev/null
    sleep 600
    exec sh loop.sh
}
