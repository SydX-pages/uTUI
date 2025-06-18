#!/bin/bash

while true; do
  clear
  echo "Select a window to switch:"
  # 列出当前会话下的所有窗口（编号 + 名称）
  tmux list-windows -F "#{window_index}:#{window_name}" |
    fzf --reverse --prompt="Window > " --height=100% |
    awk -F ':' '{print $1}' | xargs -I {} tmux select-window -t {}
  sleep 0.2
done

