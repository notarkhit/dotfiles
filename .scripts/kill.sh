#!/usr/bin/env bash

# Default signal
SIGNAL=15

# Build process list (clean + readable)
get_procs() {
  ps -eo pid,user,%cpu,%mem,etime,command --sort=-%cpu | sed 1d
}

selection=$(get_procs | fzf -m \
  --ansi \
  --height=100% \
  --layout=reverse \
  --border \
  --prompt="⚡ Kill process > " \
  --header="ENTER: kill | CTRL-K: SIGKILL | ESC: quit" \
  --bind "ctrl-k:execute-silent(echo 9 > /tmp/fzf_signal)+abort" \
  --preview '
    pid=$(echo {} | awk "{print \$1}")
    echo "PID: $pid"
    echo "-----------------------------"
    ps -fp $pid
    echo ""
    echo "Process tree:"
    pstree -p $pid 2>/dev/null
  ' \
)

# Exit if nothing selected
[ -z "$selection" ] && exit 0

# Check if user pressed Ctrl-K (SIGKILL)
[ -f /tmp/fzf_signal ] && SIGNAL=$(cat /tmp/fzf_signal) && rm /tmp/fzf_signal

# Extract PIDs
pids=$(echo "$selection" | awk '{print $1}')

# Kill
kill -$SIGNAL $pids
