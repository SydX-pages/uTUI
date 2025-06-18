#!/bin/zsh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv shell env_py1013

while true;do
    clear
    #Menu
    selected=$({echo "exit"; find ~/MyAudios -type f \( -name "*.mp3" -o -name "*.aac" -o -name "*.acc" -o -name "*.wav" \)} | fzf --reverse --prompt="Select: " --ansi)

    if [ -z "$selected" ]; then
        echo "未选择任何内容，返回..."
        continue
    fi

    cmd=$(echo "$selected")
    
    if [ "$cmd" = "exit" ]; then
        break
    else
        #filename=$(basename "$cmd" | sed 's/\.[^.]*$//') 
        dmcs "$cmd"
        continue
    fi

done
    
