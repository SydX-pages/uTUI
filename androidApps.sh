#!/bin/zsh

while true; do
  clear
  # Menu
  choices=(
    "\e[38;5;160m\e[0m|<Exit>::"
    "\e[38;5;45m---Groups---"
    "\e[38;5;10m\e[0m|Most-used Apps"
    "\e[38;5;230m\e[0m|Work and Learn"
    "\e[38;5;202m\e[0m|Entertainment"
    "\e[38;5;24m󰟾\e[0m|THE WALL"
    "\e[38;5;82m\e[0m|With Termux"
    "\e[38;5;10m\e[0m|System Apps"
    "\e[38;5;245m"
    "\e[38;5;45m---Applications---"
    "\e[38;5;45m----------A----------"
    "\e[38;5;44m\e[0m|Acode<com.foxdebug.acode>::text editor,like vscode"
    "\e[38;5;39m󱄽\e[0m|AI扫描<com.xiaomi.scanner>::Scanner"
    "\e[38;5;135m󰧹\e[0m|AutoInput<com.joaomgcd.autoinput>::Use With Tasker"
    "\e[38;5;245m"
    "\e[38;5;45m----------B----------"
    "\e[38;5;39m\e[0m|百度网盘<com.baidu.netdisk>::BaiduNetDisk"
    "\e[38;5;220m󰠮\e[0m|笔记<com.miui.notes>::BiJi" 
    "\e[38;5;170m󰟴\e[0m|哔哩哔哩<tv.danmaku.bili>::bilibili"
    "\e[38;5;202m󰘝\e[0m|不背单词<cn.com.langeasy.LangEasyLexis>::BuBeiDanCi"
    "\e[38;5;160m󰽴\e[0m|BandLab<com.bandlab.bandlab>::DAW"
    "\e[38;5;245m"
    "\e[38;5;45m----------C----------"
    "\e[38;5;150m\e[0m|Chrome<com.android.chrome>::"
    "\e[38;5;24m󰟾\e[0m|Clash<com.github.kr328.Clash>::"
    "\e[38;5;210m󰬺\e[0m|Cloudflare One<com.cloudflare.cloudflareoneagent>::"
    "\e[38;5;215m\e[0m|CSDN<net.csdn.csdnplus>::"
    "\e[38;5;245m"
    "\e[38;5;45m----------D----------"
    "\e[38;5;39m󰇮\e[0m|电子邮件<com.android.email>::DianZiYouJian"
    "\e[38;5;39m󱚠\e[0m|DeepSeek<com.deepseek.chat>::"
    "\e[38;5;245m"
    "\e[38;5;45m----------E----------"
    "\e[38;5;39m󰇩\e[0m|Edge<com.microsoft.emmx>::"
    "\e[38;5;245m"
    "\e[38;5;45m----------F----------"
    "\e[38;5;39m\e[0m|服务与反馈<com.miui.miservice>::FuWuYuFanKui"
    "\e[38;5;78m󰯺\e[0m|F-Droid<org.fdroid.fdroid>::AppStore"
    "\e[38;5;245m"
    "\e[38;5;45m----------G----------"
    "\e[38;5;202m󰊫\e[0m|Gmail<com.google.android.gm>::"
    "\e[38;5;245m"
    "\e[38;5;45m----------H----------"
    "\e[38;5;245m"
    "\e[38;5;45m----------I----------"
    "\e[38;5;245m"
    "\e[38;5;45m----------J----------"
    "\e[38;5;255m󱖦\e[0m|计算器<com.miui.calculator>::JiSuanQi"
    "\e[38;5;39m󰏆\e[0m|鲸鲮Office<com.yozo.office>::JingLing"
    "\e[38;5;39m󰫷\e[0m|Joplin<net.cozic.joplin>::for Note"
    "\e[38;5;245m"
    "\e[38;5;45m----------K----------"
    "\e[38;5;245m"
    "\e[38;5;45m----------L----------"
    "\e[38;5;202m󰖸\e[0m|联系人<com.android.contacts>::LianXiRen"
    "\e[38;5;39m󰜏\e[0m|浏览器<com.android.browser>::LiuLanQi"
    "\e[38;5;160m\e[0m|录音机<com.android.soundrecorder>::LuYinJi"
    "\e[38;5;245m"
    "\e[38;5;45m----------M----------"
    "\e[38;5;245m󰀰\e[0m|MightyAmp<com.nux.mightylite>::Nux"
    "\e[38;5;245m"
    "\e[38;5;45m----------N----------"
    "\e[38;5;245m"
    "\e[38;5;45m----------O----------"
    "\e[38;5;245m"
    "\e[38;5;45m----------P----------"
    "\e[38;5;150m󰴓\e[0m|批改网<org.pigai.allround>::PiGaiWang"
    "\e[38;5;82m󱎴\e[0m|平板管家<com.miui.securitymanager>::PingBanGuanJia"
    "\e[38;5;202m󰊼\e[0m|Play 商店<com.android.vending>::GooglePlay"
    "\e[38;5;245m"
    "\e[38;5;45m----------Q----------"
    "\e[38;5;39m\e[0m|QQ<com.tencent.mobileqq>::"
    "\e[38;5;245m"
    "\e[38;5;45m----------R----------"
    "\e[38;5;220m\e[0m|日历<com.android.calendar>::RiLi"
    "\e[38;5;245m"
    "\e[38;5;45m----------S----------"
    "\e[38;5;10m\e[0m|设置<com.android.settings>::SheZhi"
    "\e[38;5;245m\e[0m|时钟<com.android.deskclock>::ShiZhong"
    "\e[38;5;39m󰡱\e[0m|数学函数图形计算器<com.leisure.math>::ShuXueHanShuTuXingJiSuanQi"
    "\e[38;5;39m󰋅\e[0m|Songsterr<com.songsterr>::for Music Sheet"
    "\e[38;5;245m"
    "\e[38;5;45m----------T----------"
    "\e[38;5;39m󰤙\e[0m|腾讯会议<com.tencent.wemeet.app>::TengXunHuiYi" 
    "\e[38;5;39m󰖕\e[0m|天气<com.miui.weather2>::TianQi"
    "\e[38;5;135m\e[0m|Tasker<net.dinglisch.android.taskerm>::"
    "\e[38;5;39m\e[0m|Telegram<org.telegram.messenger>::"
    "\e[38;5;245m"
    "\e[38;5;45m----------U----------"
    "\e[38;5;245m"
    "\e[38;5;45m----------V----------"
    "\e[38;5;245m"
    "\e[38;5;45m----------W----------"
    "\e[38;5;160m󰫔\e[0m|网易云音乐<com.netease.cloudmusic>::wyyMusic"
    "\e[38;5;82m\e[0m|微信<com.tencent.mm>::"
    "\e[38;5;39m\e[0m|文件<com.google.android.documentsui>::WenJian,files"
    "\e[38;5;220m\e[0m|文件管理<com.android.fileexplorer>::WenJianGuanLi"
    "\e[38;5;255m\e[0m|WakeUp课程表<com.suda.yzune.wakeupschedule>::KeChengBiao"
    "\e[38;5;245m"
    "\e[38;5;45m----------X----------"
    "\e[38;5;82m\e[0m|下载管理<com.android.providers.downloads.ui>::Download"
    "\e[38;5;135m\e[0m|相册<com.miui.gallery>::XiangCe"
    "\e[38;5;245m\e[0m|相机<com.android.camera>::XiangJi"
    "\e[38;5;240m\e[0m|小米创作<com.miui.creation>::XiaoMiChuangZuo"
    "\e[38;5;245m󰢅\e[0m|小米换机<com.miui.huanji>::XiaoMiHuanJi"
    "\e[38;5;39m󰯷\e[0m|星火英语<tuoyan.com.xinghuo_daying>::XingHuoYingYu"
    "\e[38;5;150m󱕦\e[0m|学习通<com.chaoxing.mobile>::XueXiTong"
    "\e[38;5;245m"
    "\e[38;5;45m----------Y----------"
    "\e[38;5;39m\e[0m|应用商店<com.xiaomi.market>::YingYongShangDian"
    "\e[38;5;160m\e[0m|Youtube<com.google.android.youtube>::"
    "\e[38;5;245m"
    "\e[38;5;45m----------Z----------"
    "\e[38;5;240m󰬇\e[0m|知到<com.able.wisdomtree>::ZhiDao,for some online courese"
    "\e[38;5;39m\e[0m|知乎<com.zhihu.android>::ZhiHu"
    "\e[38;5;1m\e[0m|中国大学MOOC<com.netease.edu.ucmooc>::"
    "\e[38;5;230m󱓩\e[0m|自由笔记<com.freenotes.freenotes>::ZiYouBiJi"
    )

  selected=$(printf '%b\n' "${choices[@]}" | fzf --reverse --prompt="All Apps:" --ansi)

  if [ -z "$selected" ]; then
     echo "No chosen.Return to Menu..."
     continue
 fi

  if [[ "$selected" =~ ^-+[A-Z]-+$ ]]; then
      flag=1
  else
      flag=0
  fi
  case $flag in
      1)
          for letter in {A..Z}; do
              if [ "$selected" = "----------$letter----------" ]; then
                  tmux split-window -l 2 "echo 'SubMenu Loaded...';tmux popup -w 60% -h 80% "$HOME/uTUI/androidApps/Alphabet/"$letter.sh"""
                  continue
              fi
          done
          ;;
      0)
        tmp=$selected
        selected=$(echo "$tmp" | awk -F ">" '{print $1}' | awk -F "<" '{print $2}')
        if [ "$selected" = "" ]; then
            selected=$(echo "$tmp" | awk -F "|" '{print $2}')
            case "$selected" in
                "Most-used Apps")
                    tmux split-window -l 2 "echo 'SubMenu Loaded...';tmux popup -w 60% -h 80% "$HOME/uTUI/androidApps/androidApps_MostUse.sh""
                    ;;
                "System Apps")
                    tmux split-window -l 2 "echo 'SubMenu Loaded...';tmux popup -w 60% -h 80% "$HOME/uTUI/androidApps/androidApps_Sys.sh""
                    ;;
                "Work and Learn")
                    tmux split-window -l 2 "echo 'SubMenu Loaded...';tmux popup -w 60% -h 80% "$HOME/uTUI/androidApps/androidApps_WorkApps.sh""
                    ;;
                "Entertainment")
                    tmux split-window -l 2 "echo 'SubMenu Loaded...';tmux popup -w 60% -h 80% "$HOME/uTUI/androidApps/androidApps_Entertainment.sh""
                    ;;
                "THE WALL")
                    tmux split-window -l 2 "echo 'SubMenu Loaded...';tmux popup -w 60% -h 80% "$HOME/uTUI/androidApps/androidApps_Wall.sh""
                    ;;
                "With Termux")
                    tmux split-window -l 2 "echo 'SubMenu Loaded...';tmux popup -w 60% -h 80% "$HOME/uTUI/androidApps/androidApps_withTermux.sh.sh""
                    ;;
                *)
                    continue
                    ;;
            esac
        else
            name=$(echo "$tmp" | awk -F "<" '{print $1}' | awk -F "|" '{print $2}') 
            if [ "$selected" = "Exit" ]; then
                echo "Going Back..."
                sleep 1
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
        fi
        ;;
    esac
        
done
