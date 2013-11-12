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

  brew install $list

  brew unlink ruby && brew link ruby
fi
