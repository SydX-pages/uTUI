#!/bin/zsh

while true;do
    clear
    # Menu
    selected=$({echo "Exit"; echo "RaspberryPi"; echo "VivoSvr"; echo "GgCVPS"; echo "Windows"; echo "Others"} | fzf --reverse --prompt="Select: " --ansi)

    if [ -z "$selected" ]; then
        echo "未选择任何内容，返回..."
        continue
    else
        case $selected in
            RaspberryPi)
                Rpisvr
                ;;
            VivoSvr)
                Vivosvr
                ;;
            GgCVPS)
                Gcp
                ;;
            Windows)
                WinSvr
                ;;
            Others)
                server
                ;;
            Exit)
                echo "Quiting..."
                sleep 1
                exit
                ;;
            *)
                echo "Unknown Server..."
                sleep 1
                continue
                ;;
        esac
    fi
done
