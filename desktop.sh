#!/bin/zsh

while true; do
  clear
  # Menu
  choices=(
    "\e[38;5;160m\e[0m|Exit::exit"
    "\e[38;5;82m\e[0m|AndroidApps::$HOME/uTUI/androidApps.sh"
    "\e[38;5;220m\e[0m|FileManager::$HOME/uTUI/apps/file_manager.sh"
    "\e[38;5;82m\e[0m|Terminal::$HOME/uTUI/apps/terminal.sh"
    "\e[38;5;44m\e[0m|MyServers::$HOME/uTUI/apps/ServerLauncher.sh"
    "\e[38;5;202m󰪁\e[0m|Gemini::$HOME/uTUI/apps/Gemini.sh"
    "\e[38;5;39m󱓩\e[0m|TextEditor::$HOME/uTUI/apps/text_editor.sh"
    "\e[38;5;44m󰞉\e[0m|WebBrowser::$HOME/uTUI/apps/web_browser.sh"
    "\e[38;5;202m󰄨\e[0m|SysMonitor::$HOME/uTUI/apps/system_monitor.sh"
    "\e[38;5;245m󰙽\e[0m|Demucs::$HOME/uTUI/apps/demucs.sh"
    "\e[38;5;135m\e[0m|MusicPlayer::$HOME/uTUI/apps/Audio_Player.sh"
    "\e[38;5;220m\e[0m|EmojiPrinter::$HOME/uTUI/apps/emoji_fzf.sh"
  )

  selected=$(printf '%b\n' "${choices[@]}" | fzf --reverse --prompt="Desktop (Prefix+F for fzf)" --ansi)

  if [ -z "$selected" ]; then
    echo "No chosen.Return to Menu..."
    continue
  fi

  # chosen command
  cmd=$(echo "$selected" | awk -F "::" '{print $2}')

  if [ "$cmd" = "exit" ]; then
    echo "Exit From Desk"
    tmux kill-session
    break
  elif [ -x "$cmd" ]; then
    clear
    app_name=$(echo "$selected" | awk -F "::" '{print $1}')
    tmux new-window -n $app_name "$cmd"
  else
    echo "Unknown command or command can't run：$cmd"
  fi
done

