#!/bin/zsh

while true; do
  clear
  # Menu
  choices=(
    "\e[38;5;160m\e[0m|<Exit>::"
    "\e[38;5;44m\e[0m|Acode<com.foxdebug.acode>::text editor,like vscode"
    "\e[38;5;202m󰘝\e[0m|不背单词<cn.com.langeasy.LangEasyLexis>::BuBeiDanCi"
    "\e[38;5;39m󰏆\e[0m|鲸鲮Office<com.yozo.office>::JingLing"
    "\e[38;5;39m󰫷\e[0m|Joplin<net.cozic.joplin>::for Note"
    "\e[38;5;150m󰴓\e[0m|批改网<org.pigai.allround>::PiGaiWang"
    "\e[38;5;39m󰡱\e[0m|数学函数图形计算器<com.leisure.math>::ShuXueHanShuTuXingJiSuanQi"
    "\e[38;5;39m󰤙\e[0m|腾讯会议<com.tencent.wemeet.app>::TengXunHuiYi" 
    "\e[38;5;255m\e[0m|WakeUp课程表<com.suda.yzune.wakeupschedule>::KeChengBiao"
    "\e[38;5;39m󰯷\e[0m|星火英语<tuoyan.com.xinghuo_daying>::XingHuoYingYu"
    "\e[38;5;150m󱕦\e[0m|学习通<com.chaoxing.mobile>::XueXiTong"
    "\e[38;5;240m󰬇\e[0m|知到<com.able.wisdomtree>::ZhiDao,for some online courese"
    "\e[38;5;1m\e[0m|中国大学MOOC<com.netease.edu.ucmooc>::"
    "\e[38;5;230m󱓩\e[0m|自由笔记<com.freenotes.freenotes>::ZiYouBiJi"
    )

  selected=$(printf '%b\n' "${choices[@]}" | fzf --reverse --prompt="Work and Learn:" --ansi)
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

