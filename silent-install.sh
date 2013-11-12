#!/usr/bin/env bash
if [ ! -d ~/.bash_it ]; then cd && git clone https://github.com/qcook2000/bash-it.git .bash_it; else cd ~/.bash_it && git pull; fi; ~/.bash_it/install.sh
