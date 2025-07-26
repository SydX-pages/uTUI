#!/bin/zsh

while true; do
  clear
  # Menu
  choices=(
    "\e[38;5;160m\e[0m|<Exit>::"
    "-X-"
    "\e[38;5;82m\e[0m|下载管理<com.android.providers.downloads.ui>::Download"
    "\e[38;5;135m\e[0m|相册<com.miui.gallery>::XiangCe"
    "\e[38;5;245m\e[0m|相机<com.android.camera>::XiangJi"
    "\e[38;5;240m\e[0m|小米创作<com.miui.creation>::XiaoMiChuangZuo"
    "\e[38;5;245m󰢅\e[0m|小米换机<com.miui.huanji>::XiaoMiHuanJi"
    "\e[38;5;39m󰯷\e[0m|星火英语<tuoyan.com.xinghuo_daying>::XingHuoYingYu"
    "\e[38;5;150m󱕦\e[0m|学习通<com.chaoxing.mobile>::XueXiTong"
 
   )

  selected=$(printf '%b\n' "${choices[@]}" | fzf --reverse --prompt="Apps:" --ansi)
  if [[ "$selected" =~ ^-[A-Z]-$ ]]; then
      flag=1
  else
      flag=0
  fi
  case $flag in
      1)
          for letter in {A..Z}; do
              if [ "$selected" = "-$letter-" ]; then
                  $HOME/uTUI/androidApps/"$letter.sh"
              fi
          done
           
          ;;
      0)
        tmp=$selected
        selected=$(echo "$tmp" | awk -F ">" '{print $1}' | awk -F "<" '{print $2}')
        name=$(echo "$tmp" | awk -F "<" '{print $1}' | awk -F "|" '{print $2}')
        if [ -z "$selected" ]; then
            echo "No chosen.Return to Menu..."
            continue
        fi
        if [ "$selected" = "Exit" ]; then
            echo "Pressing Ctrl-C to exit..."
            break
        else
            choices=(
                "\e[38;5;82m\e[0m|Launch App"
                "\e[38;5;10m\e[0m|App Settings"
                "\e[38;5;160m\e[0m|Cancel"
            )
            act=$(printf '%b\n' "${choices[@]}" | fzf --reverse --prompt="Android Apps" --ansi)
            act=$(echo "$act" | awk -F "|" '{print $2}')
            if [ "$act" = "Cancel" ]; then
                continue
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
        fi
        ;;
    esac
done
