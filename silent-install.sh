#!/usr/bin/env bash
BASH_IT="$HOME/.bash_it"

if [ ! -d ~/.bash_it ]; then
  cd && git clone git@github.com:qcook2000/bash-it.git .bash_it
fi
cd ~/.bash_it && git pull && cd

cp $HOME/.bash_it/template/bash_profile.template.bash $HOME/.bash_profile

declare -a plugins=(base battery browser dirs extract fasd git java latex nginx node nvm osx python rbenv ruby rvm ssh tmux tmuxinator)
declare -a aliases=(bundler general git homebrew osx sublime)
declare -a completions=(bash-it brew defaults gem git git_flow pip ssh)

for plugin in plugins; do
  echo "installing ${plugin}";
  bash-it enable plugin "$plugin"
done
for alias in aliases; do
  bash-it enable alias "$alias"
done
for completion in completions; do
  bash-it enable completion "$completion"
done
