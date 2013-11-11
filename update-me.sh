if [ "$(uname)" = "Darwin" ]; then
  # Do something under Mac OS X platform
  sh $BASH_IT/scripts/update-me-osx.sh;
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
  # Do something under Linux platform
  sh $BASH_IT/scripts/update-me-linux.sh;
elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
  # Do something under Windows NT platform
  # sh scripts/update-me-win.sh;
  echo "yay"''
fi
