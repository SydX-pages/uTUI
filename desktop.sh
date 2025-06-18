#!/bin/zsh

while true; do
  clear
  # Menu
  choices=(
    "📁FileManager::$HOME/uTUI/apps/file_manager.sh"
    "📝TextEditor::$HOME/uTUI/apps/text_editor.sh"
    "🌐WebBrowser::$HOME/uTUI/apps/web_browser.sh"
    "💻Terminal::$HOME/uTUI/apps/terminal.sh"
    "📊SysMonitor::$HOME/uTUI/apps/system_monitor.sh"
    "🎹Demucs::$HOME/uTUI/apps/demucs.sh"
    "🎵MusicPlayer::$HOME/uTUI/apps/Audio_Player.sh"
    "😀EmojiPrinter::$HOME/uTUI/apps/emoji_fzf.sh"
    "🚪Exit::exit"
  )

  selected=$(printf '%s\n' "${choices[@]}" | fzf --reverse --prompt="Desktop (Prefix+F for fzf)" --ansi)

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

