#!/bin/zsh

EMOJI_JSON=$HOME/uTUI/emoji.json

while true; do
  emoji=$(
    (
      echo "|exit"
      jq -r '.[] | "\(.emoji) \(.description)"' "$EMOJI_JSON"
    ) | fzf --height=40% --border --prompt="Pick emoji: " | awk '{print $1}'
  )

  if [ -z "$emoji" ] || [ "$emoji" = "|exit" ]; then
    echo "Exiting..."
    sleep 1
    break
  fi

  echo -n "$emoji"
  echo "$emoji" | termux-clipboard-set
done

