#!/bin/zsh

while true; do
  clear
  # Menu
  choices=(
    "\e[38;5;160m\e[0m|Exit::"
    "\e[38;5;39m\e[0m|QQ::"
    "\e[38;5;82m\e[0m|微信::"
    "\e[38;5;39m󰇩\e[0m|Edge::"
    "\e[38;5;150m\e[0m|Chrome::"
    "\e[38;5;135m\e[0m|Tasker::"
    "\e[38;5;39m\e[0m|知乎::"
    "\e[38;5;160m󰫔\e[0m|网易云音乐::"
    "\e[38;5;170m󰟴\e[0m|哔哩哔哩::"
    "\e[38;5;39m\e[0m|百度网盘::"
    "\e[38;5;39m󰋅\e[0m|Songsterr::"
    "\e[38;5;44m\e[0m|Acode::"
    "\e[38;5;39m󱚠\e[0m|DeepSeek::"
    "\e[38;5;160m\e[0m|Youtube::"
    "\e[38;5;210m󰬺\e[0m|1.1.1.1::"
    "\e[38;5;39m󱄽\e[0m|AI扫描::"
    "\e[38;5;135m󰧹\e[0m|AutoInput::"
    "\e[38;5;160m󰽴\e[0m|BandLab::"
    "\e[38;5;24m󰟾\e[0m|Clash::"
    "\e[38;5;215m\e[0m|CSDN::"
    "\e[38;5;78m󰯺\e[0m|F-Droid::"
    "\e[38;5;202m󰊫\e[0m|Gmail::"
    "\e[38;5;39m󰫷\e[0m|Joplin::"
    "\e[38;5;245m󰀰\e[0m|MightyAmp::"
    "\e[38;5;202m󰊼\e[0m|Play商店::"
    "\e[38;5;39m\e[0m|Telegram::"
    "\e[38;5;82m\e[0m|Termux::"
    "\e[38;5;255m\e[0m|WakeUp课程表::"
    "\e[38;5;82m\e[0m|下载管理::"
    "\e[38;5;202m󰘝\e[0m|不背单词::"
    "\e[38;5;1m\e[0m|中国大学MOOC::"
    "\e[38;5;39m󰖕\e[0m|天气::"
    "\e[38;5;150m󱕦\e[0m|学习通::"
    "\e[38;5;240m\e[0m|小米创作::"
    "\e[38;5;245m󰢅\e[0m|小米换机::"
    "\e[38;5;82m󱎴\e[0m|平板管家::"
    "\e[38;5;39m\e[0m|应用商店::"
    "\e[38;5;160m\e[0m|录音机::"
    "\e[38;5;150m󰴓\e[0m|批改网::"
    "\e[38;5;39m󰡱\e[0m|数学函数图形计算器::"
    "\e[38;5;39m\e[0m|文件::"
    "\e[38;5;220m\e[0m|文件管理::"
    "\e[38;5;220m\e[0m|日历::"
    "\e[38;5;245m\e[0m|时钟::"
    "\e[38;5;39m󰯷\e[0m|星火英语::"
    "\e[38;5;39m\e[0m|服务与反馈::"
    "\e[38;5;39m󰜏\e[0m|浏览器::"
    "\e[38;5;39m󰇮\e[0m|电子邮件::"
    "\e[38;5;135m\e[0m|相册::"
    "\e[38;5;245m\e[0m|相机::"
    "\e[38;5;240m󰬇\e[0m|知到::"
    "\e[38;5;220m󰠮\e[0m|笔记::"
    "\e[38;5;202m\e[0m|系统桌面::" 
    "\e[38;5;202m󰖸\e[0m|联系人::"
    "\e[38;5;39m󰤙\e[0m|腾讯会议::" 
    "\e[38;5;230m󱓩\e[0m|自由笔记::"
    "\e[38;5;255m󱖦\e[0m|计算器::"
    "\e[38;5;10m\e[0m|设置FallbackHom::"
    "\e[38;5;10m\e[0m|设置MainSettings::"
    "\e[38;5;39m󰏆\e[0m|鲸鲮Office::"
    )

  selected=$(printf '%b\n' "${choices[@]}" | fzf --reverse --prompt="Android Apps" --ansi)
  tmp=$selected
  selected=$(echo "$tmp" | awk -F "::" '{print $1}' | awk -F "|" '{print $2}')
  if [ -z "$selected" ]; then
    echo "No chosen.Return to Menu..."
    continue
  fi

  if [ "$selected" = "Exit" ]; then
    echo "Going Back..."
    sleep 1
    break
  else
    txk "AppLauncher" "/data/data/com.termux/files/home/Scripts/LaunchApp.sh \"$selected\""
    echo "Launching $selected..."
    sleep 4
  fi
done

