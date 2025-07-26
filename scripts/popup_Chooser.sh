#!/bin/zsh
                selected=$1
                name=$2
 
                tmux popup -- \
                    zsh -c '
                selected=$1
                name=$2
                choices=(
                    "\e[38;5;82m\e[0m|Launch App"
                    "\e[38;5;10m\e[0m|App Settings"
                    "\e[38;5;160m\e[0m|Cancel"
                )
                act=$(printf "%b\n" "${choices[@]}" | fzf --reverse --prompt="Android Apps" --ansi)
                act=$(echo "$act" | awk -F "|" '\''{print $2}'\'')
                if [ "$act" = "Cancel" ]; then
                    echo "Press Ctrl-c to quit"
                    exit 0
                elif [ "$act" = "Launch App" ]; then
                    act=1
                    action="Launching:"
                else
                    act=0
                    action="Jumping to Settings:"
                fi
                txk "AppLauncher" "/data/data/com.termux/files/home/Scripts/LaunchApp.sh "$act" \"$selected\""
                echo "$action $name..."
                sleep 3
                echo "Press Ctrl-c to quit"' dummy "$selected" "$name"
 
