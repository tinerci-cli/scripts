#!/usr/bin/env bash
selected=`cat ~/.local/share/datas/language.cht ~/.local/share/datas/util.cht | fzy`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.local/share/datas/language.cht; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl -s cht.sh/$selected/:$query | bat"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | bat"
fi
