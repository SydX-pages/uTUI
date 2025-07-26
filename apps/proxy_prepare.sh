#/bin/zsh

echo "Remember to Run 'SetPxy' When Starting A New Window and 'NoPxy' to Stop The Proxy"
ssh -i ~/.ssh/googleC -D 1080 -C -q -N syd_w@35.212.201.148


