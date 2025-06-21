#!/bin/zsh

while true; do
  clear
  # Menu
  choices=(
    "\e[38;5;160m\e[0m|<Exit>::"
    "\e[38;5;39m󱄽\e[0m|AI扫描<com.xiaomi.scanner>::Scanner"
    "\e[38;5;220m󰠮\e[0m|笔记<com.miui.notes>::BiJi" 
    "\e[38;5;39m󰇮\e[0m|电子邮件<com.android.email>::DianZiYouJian"
    "\e[38;5;39m\e[0m|服务与反馈<com.miui.miservice>::FuWuYuFanKui"
    "\e[38;5;255m󱖦\e[0m|计算器<com.miui.calculator>::JiSuanQi"
    "\e[38;5;202m󰖸\e[0m|联系人<com.android.contacts>::LianXiRen"
    "\e[38;5;39m󰜏\e[0m|浏览器<com.android.browser>::LiuLanQi"
    "\e[38;5;160m\e[0m|录音机<com.android.soundrecorder>::LuYinJi"
    "\e[38;5;82m󱎴\e[0m|平板管家<com.miui.securitymanager>::PingBanGuanJia"
    "\e[38;5;220m\e[0m|日历<com.android.calendar>::RiLi"
    "\e[38;5;10m\e[0m|设置<com.android.settings>::SheZhi"
    "\e[38;5;245m\e[0m|时钟<com.android.deskclock>::ShiZhong"
    "\e[38;5;39m󰖕\e[0m|天气<com.miui.weather2>::TianQi"
    "\e[38;5;39m\e[0m|文件<com.google.android.documentsui>::WenJian,files"
    "\e[38;5;220m\e[0m|文件管理<com.android.fileexplorer>::WenJianGuanLi"
    "\e[38;5;82m\e[0m|下载管理<com.android.providers.downloads.ui>::Download"
    "\e[38;5;135m\e[0m|相册<com.miui.gallery>::XiangCe"
    "\e[38;5;245m\e[0m|相机<com.android.camera>::XiangJi"
    "\e[38;5;240m\e[0m|小米创作<com.miui.creation>::XiaoMiChuangZuo"
    "\e[38;5;245m󰢅\e[0m|小米换机<com.miui.huanji>::XiaoMiHuanJi"
    "\e[38;5;39m\e[0m|应用商店<com.xiaomi.market>::YingYongShangDian"
    )

  selected=$(printf '%b\n' "${choices[@]}" | fzf --reverse --prompt="System Apps:" --ansi)
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

