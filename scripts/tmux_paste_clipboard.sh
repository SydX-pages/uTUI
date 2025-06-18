#!/bin/zsh

termux-clipboard-get | tmux load-buffer -     # 将剪贴板内容加载进 tmux buffer
tmux paste-buffer                              # 粘贴 buffer
