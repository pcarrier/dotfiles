autoload -U compinit
compinit

bindkey -e vi

zstyle ':completion:*' menu select

zmodload -a colors
zmodload -a autocomplete
zmodload -a complist

setopt autocd autopushd pushdminus pushdsilent pushdtohome
setopt HIST_REDUCE_BLANKS HIST_IGNORE_SPACE SHARE_HISTORY inc_append_history
setopt print_exit_value no_hup no_clobber
setopt extendedglob glob_dots
setopt correct

mkcd() { mkdir -p "$1"; cd "$1"; }
mtar() { tarparms="$1"; shift; for fn in $@; do tar "$tarparms" "$fn"; done; }
otmux() { tmux attach-session -d -t "$1" || tmux new-session -s "$1"; }
sprunge() { 'curl -F '\''sprunge=<-'\'' http://sprunge.us'; }

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

case $TERM in
    rxvt|*term)
        precmd() { print -Pn "\e]0;%m:%~\a" }
        preexec () { print -Pn "\e]0;$1\a" }
    ;;
esac

autoload -U colors
colors
PS1="%{%B$fg[red]%}%n%{$reset_color%B%}@%{$fg[green]%}%m %{%b$fg[magenta]%}%1~ %{$reset_color%}%# "
RPS1="%M:%d"

alias sshow="serverdb-show-host"
alias vin="sublime"
alias vinn="sublime -n"
alias rmterm="mterm -o'-A -lroot'"
alias ops="opshost"
alias dotgit="GIT_DIR=$HOME/repos/dotfiles.git GIT_WORK_TREE=$HOME git"

hash -d logs="/var/logs"
hash -d servers="/media/servers"
hash -d ssd="/media/ssd"
hash -d hdd="/media/hdd"
hash -d spotifiles="/media/spotifiles"

if [ -n "${ITERM_SESSION_ID}" ] # ugly way to spot OSX
then
	alias ls="ls -liFG"
else
	alias ls="ls -liF --color"
fi

source $HOME/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
