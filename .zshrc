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
setopt extendedglob
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

alias ls="ls -liF --color"
