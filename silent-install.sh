#!/usr/bin/env bash
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
