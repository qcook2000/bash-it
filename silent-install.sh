#!/usr/bin/env bash
BASH_IT="$HOME/.bash_it"

if [ ! -d ~/.bash_it ] {
  cd && git clone git@github.com:qcook2000/bash-it.git .bash_it
}
cd ~/.bash_it && git pull && cd

cp $HOME/.bash_it/template/bash_profile.template.bash $HOME/.bash_profile

ln -s "$path" "$BASH_IT/$file_type/enabled"
declare -a plugins=(base battery browser dirs extract fasd git java latex nginx node nvm osx python rbenv ruby rvm ssh tmux tmuxinator)
declare -a aliases=(bundler general git homebrew osx sublime)
declare -a completions=(bash-it brew defaults gem git git_flow pip ssh)

for plugin in plugins; do
  ln -s "$BASH_IT/plugins/available/${plugin}.plugin.bash" "$BASH_IT/plugins/enabled"
done
for alias in aliases; do
  ln -s "$BASH_IT/plugins/available/${alias}.aliases.bash" "$BASH_IT/plugins/enabled"
done
for completion in completions; do
  ln -s "$BASH_IT/plugins/available/${completion}.completion.bash" "$BASH_IT/plugins/enabled"
done
