#!/bin/zsh

EMOJI_JSON=$HOME/desktop/emoji.json

while true; do
  emoji=$(
    (
      echo "❌ exit"
      jq -r '.[] | "\(.emoji) \(.description)"' "$EMOJI_JSON"
    ) | fzf --height=40% --border --prompt="Pick emoji: " | awk '{print $1}'
  )

  if [ -z "$emoji" ] || [ "$emoji" = "❌" ]; then
    echo "退出 emoji 选择器"
    break
  fi

  echo -n "$emoji"
  echo "$emoji" | termux-clipboard-set
done

