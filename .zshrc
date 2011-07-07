# Path to your oh-my-zsh configuration.
export ZSH=$HOME/repos/oh-my-zsh
export ZSH_THEME=pmcgee
export EDITOR="vim"

# (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(osx gem brew npm ruby rvm)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin
export CLICOLOR=1

#for cmd in grep fgrep egrep; do
#        alias $cmd="$cmd --color=auto"
#done

# source /usr/local/Cellar/coreutils/*/aliases
# alias ls="/usr/local/bin/gls --color=auto"

mkcd() { mkdir -p "$1"; cd "$1"; }
mtar() { tarparms="$1"; shift; for fn in $@; do tar "$tarparms" "$fn"; done; }
otmux() { tmux attach-session -d -t "$1" || tmux new-session -s "$1"; }
sprunge() { 'curl -F '\''sprunge=<-'\'' http://sprunge.us'; }

export ARCHFLAGS="-arch x86_64" #... -arch i386"

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
