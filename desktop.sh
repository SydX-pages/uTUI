#!/bin/zsh

while true; do
  clear
  # Menu
  choices=(
    "📁FileManager::$HOME/desktop/apps/file_manager.sh"
    "📝TextEditor::$HOME/desktop/apps/text_editor.sh"
    "🌐WebBrowser::$HOME/desktop/apps/web_browser.sh"
    "💻Terminal::$HOME/desktop/apps/terminal.sh"
    "📊SysMonitor::$HOME/desktop/apps/system_monitor.sh"
    "🎹Demucs::$HOME/desktop/apps/demucs.sh"
    "🎵MusicPlayer::$HOME/desktop/apps/Audio_Player.sh"
    "😀EmojiPrinter::$HOME/desktop/apps/emoji_fzf.sh"
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

