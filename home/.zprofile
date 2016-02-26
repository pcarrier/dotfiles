#!/bin/zsh

export HOSTNAME=$(hostname -f) OS=$(uname -s) ARCH=$(uname -m)
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 LC_COLLATE=C

export PYTHON=python2.7

export GOPATH=$HOME/go GOROOT=$HOME/opt/go

export PATH=\
$HOME/.local/bin:\
$HOME/bin:\
$HOME/opt/go/bin:\
$HOME/.npm/bin:\
$HOME/.gem/ruby/2.3.0/bin:\
$HOME/Library/Python/2.7/bin:\
$GOPATH/bin:\
$HOME/ws/src/github.com/meteor/mdgscripts/bin:\
/usr/bin/core_perl:/usr/bin/vendor_perl:\
/usr/local/bin:/usr/local/sbin:\
/usr/bin:/usr/sbin:\
/bin:/sbin:\
/usr/games

export VISUAL='nvim' EDITOR='nvim' MANPAGER=most

if [[ Darwin = $OS ]]; then
  eval $(docker-machine env dev)
else
  export BROWSER=google-chrome-beta
fi

export MACHINEID=$(dbus-uuidgen --get)
export UNISONLOCALHOSTNAME="${HOSTNAME}_${MACHINEID}"
export HISTSIZE=1048576 SAVEHIST=1048576 HISTFILE="$HOME/.history"

autoload -U colors && colors

export NINJA_STATUS="${fg[blue]}rem:%u run:%r fin:%f time:%e${reset_color} "

# Don't forget `disable -r time` :]
export TIME=\
"${fg_bold[red]}time "\
"${fg_no_bold[blue]}elapsed${reset_color}=%E "\
"${fg_no_bold[blue]}user${reset_color}=%U "\
"${fg_no_bold[blue]}system${reset_color}=%S "\
"${fg_no_bold[blue]}cpu${reset_color}=%P "\
"${fg_bold[red]}rss "\
"${fg_no_bold[blue]}max${reset_color}=%M\n"\
"${fg_bold[red]}fs "\
"${fg_no_bold[blue]}in${reset_color}=%I "\
"${fg_no_bold[blue]}out${reset_color}=%O "\
"${fg_bold[red]}faults "\
"${fg_no_bold[blue]}major${reset_color}=%F "\
"${fg_no_bold[blue]}minor${reset_color}=%R "\
"${fg_bold[red]}ctx "\
"${fg_no_bold[blue]}asked${reset_color}=%w "\
"${fg_no_bold[blue]}forced${reset_color}=%c"

eval $(keychain --eval --quiet --quick)

ulimit -c unlimited
