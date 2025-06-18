#!/bin/zsh

while true;do
    clear
    # Menu
    selected=$({echo "exit"; find ~/MyAudios -type f \( -name "*.mp3" -o -name "*.aac" -o -name "*.acc" -o -name "*.wav" \)} | fzf --reverse --prompt="Select: " --ansi)

    if [ -z "$selected" ]; then
        echo "未选择任何内容，返回..."
        continue
    fi

    SRC_PATH=$(echo "$selected")
    
    if [ "$SRC_PATH" = "exit" ]; then
        break
    else
        mPlay "$SRC_PATH"
        continue
    fi
done
