#!/bin/zsh

while true; do
  clear
  # Menu
  choices=(
    "\e[38;5;160m\e[0m|<Exit>::"
    "\e[38;5;44m\e[0m|Acode<com.foxdebug.acode>::text editor,like vscode"
    "\e[38;5;39m\e[0m|百度网盘<com.baidu.netdisk>::BaiduNetDisk"
    "\e[38;5;170m󰟴\e[0m|哔哩哔哩<tv.danmaku.bili>::bilibili"
    "\e[38;5;24m󰟾\e[0m|Clash<com.github.kr328.clash>::"
    "\e[38;5;39m󱚠\e[0m|DeepSeek<com.deepseek.chat>::"
    "\e[38;5;39m󰇩\e[0m|Edge<com.microsoft.emmx>::"
    "\e[38;5;39m\e[0m|QQ<com.tencent.mobileqq>::"
    "\e[38;5;39m\e[0m|v2rayNG<com.v2ray.ang>::"
    "\e[38;5;82m\e[0m|微信<com.tencent.mm>::"
    "\e[38;5;39m\e[0m|知乎<com.zhihu.android>::ZhiHu"
    "\e[38;5;230m󱓩\e[0m|自由笔记<com.freenotes.freenotes>::ZiYouBiJi"
    )

  selected=$(printf '%b\n' "${choices[@]}" | fzf --reverse --prompt="Most-used Apps:" --ansi)
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
done

