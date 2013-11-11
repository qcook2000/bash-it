#!/usr/bin/env bash
BASH_IT="$HOME/.bash_it"

test -w $HOME/.bash_profile &&
  cp $HOME/.bash_profile $HOME/.bash_profile.bak &&
  echo "Your original .bash_profile has been backed up to .bash_profile.bak"

cp $HOME/.bash_it/template/bash_profile.template.bash $HOME/.bash_profile


function load_all() {
  file_type=$1
  [ ! -d "$BASH_IT/$file_type/enabled" ] && mkdir "$BASH_IT/${file_type}/enabled"
  for src in $BASH_IT/${file_type}/available/*; do
      filename="$(basename ${src})"
      [ ${filename:0:1} = "_" ] && continue
      dest="${BASH_IT}/${file_type}/enabled/${filename}"
      if [ ! -e "${dest}" ]; then
          ln -s "${src}" "${dest}"
      else
          echo "File ${dest} exists, skipping"
      fi
  done
}

for type in "aliases" "plugins" "completion"
do
  load_all $type
done
