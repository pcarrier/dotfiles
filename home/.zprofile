#!/bin/zsh

export HOSTNAME=$(hostname -f) OS=$(uname -s) ARCH=$(uname -m)

export CORESTORAGE_HOME=$HOME/src/corestorage

export GOPATH=$HOME/go

PATH=$HOME/bin:\
$CORESTORAGE_HOME/manhattan/bin:\
$CORESTORAGE_HOME/shell_utils:\
$HOME/.gem/ruby/2.0.0:\
/usr/lib/jvm/default/bin:\
$GOPATH/bin:\
/usr/local/bin:/usr/local/sbin:\
/usr/bin:/usr/sbin:\
/bin:/sbin

for dirname in $(grep -v '^#' ~/.tools | sed -e "s,@NATIVE@,${OS}.${ARCH},") /home/aurora/tools/dottools; do
  for bin in bin bin.$OS.$ARCH; do
    [[ -d "$HOME/.tools-cache${dirname}/$bin" ]] && PATH="$HOME/.tools-cache${dirname}/$bin:$PATH"
  done
    [[ -d "$HOME/.tools-cache${dirname}/man" ]] && MANPATH="$HOME/.tools-cache${dirname}/man:$MANPATH"
done
export PATH MANPATH

export VISUAL=vim EDITOR=vim MANPAGER=most
export MACHINEID=$(dbus-uuidgen --get)
export UNISONLOCALHOSTNAME="${HOSTNAME}_${MACHINEID}"
export HISTSIZE=1048576 SAVEHIST=1048576 HISTFILE="$HOME/.history"

autoload -U colors && colors

export NINJA_STATUS="${fg[blue]}rem:%u run:%r fin:%f time:%e${reset_color} "

# Don't forget `disable -r time` :]
export TIME=\
"${fg_bold[red]}time "\
"${fg_bold[white]}elapsed${reset_color}=%E "\
"${fg_bold[white]}user${reset_color}=%U "\
"${fg_bold[white]}system${reset_color}=%S "\
"${fg_bold[white]}cpu${reset_color}=%P "\
"${fg_bold[red]}rss "\
"${fg_bold[white]}max${reset_color}=%M\n"\
"${fg_bold[red]}fs "\
"${fg_bold[white]}in${reset_color}=%I "\
"${fg_bold[white]}out${reset_color}=%O "\
"${fg_bold[red]}faults "\
"${fg_bold[white]}major${reset_color}=%F "\
"${fg_bold[white]}minor${reset_color}=%R "\
"${fg_bold[red]}ctx "\
"${fg_bold[white]}asked${reset_color}=%w "\
"${fg_bold[white]}forced${reset_color}=%c"

eval $(keychain --eval --quiet --quick)

ulimit -c unlimited
