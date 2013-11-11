# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Some tools look for XCode, even though they don't need it.
# https://github.com/joyent/node/issues/3681
# https://github.com/mxcl/homebrew/issues/10245
if [[ ! -d "$('xcode-select' -print-path 2>/dev/null)" ]]; then
  sudo xcode-select -switch /usr/bin
fi

# Install Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  e_header "Installing Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

if [[ "$(type -P brew)" ]]; then
  brew doctor
  brew update

  # Install Homebrew recipes.
  recipes=(
    atk
    atkmm
    autoconf
    automake
    bash
    bdw-gc
    boost-build
    cairo
    cairomm
    cmake
    cowsay
    eot-utils
    fontconfig
    fontforge
    freetype
    fuse4x
    fuse4x-kext
    gdbm
    gdk-pixbuf
    gettext
    git
    git-extras
    glib
    glibmm
    gobject-introspection
    gtk+
    gtkmm
    harfbuzz
    htop-osx
    hub
    icu4c
    id3tool
    imagemagick
    intltool
    jpeg
    lesspipe
    libcroco
    libffi
    libpng
    librsvg
    libsigc++
    libtiff
    libtool
    libyaml
    man2html
    mm-common
    nmap
    node
    openssl
    pango
    pangomm
    php55
    pixman
    pkg-config
    python
    python3
    rbenv
    readline
    rsync
    ruby
    ruby-build
    sl
    sqlite
    ssh-copy-id
    sshfs
    tree
    ttfautohint
    unixodbc
    xz
    zlib
  )

  list="$(to_install "${recipes[*]}" "$(brew list)")"
  if [[ "$list" ]]; then
    e_header "Installing Homebrew recipes: $list"
    brew install $list
  fi

  # This is where brew stores its binary symlinks
  local binroot="$(brew --config | awk '/HOMEBREW_PREFIX/ {print $2}')"/bin

  # htop
  if [[ "$(type -P $binroot/htop)" && "$(stat -L -f "%Su:%Sg" "$binroot/htop")" != "root:wheel" || ! "$(($(stat -L -f "%DMp" "$binroot/htop") & 4))" ]]; then
    e_header "Updating htop permissions"
    sudo chown root:wheel "$binroot/htop"
    sudo chmod u+s "$binroot/htop"
  fi

  # bash
  if [[ "$(type -P $binroot/bash)" && "$(cat /etc/shells | grep -q "$binroot/bash")" ]]; then
    e_header "Adding $binroot/bash to the list of acceptable shells"
    echo "$binroot/bash" | sudo tee -a /etc/shells >/dev/null
  fi
  if [[ "$SHELL" != "$binroot/bash" ]]; then
    e_header "Making $binroot/bash your default shell"
    sudo chsh -s "$binroot/bash" "$USER" >/dev/null 2>&1
    e_arrow "Please exit and restart all your shells."
  fi

  # i don't remember why i needed this?!
  if [[ ! "$(type -P gcc-4.2)" ]]; then
    e_header "Installing Homebrew dupe recipe: apple-gcc42"
    brew install https://raw.github.com/Homebrew/homebrew-dupes/master/apple-gcc42.rb
  fi
fi
