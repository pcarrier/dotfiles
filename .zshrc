autoload -U compinit
compinit

bindkey -e vi

zstyle ':completion:*' menu select

zmodload -a colors
zmodload -a autocomplete
zmodload -a complist

setopt autocd autopushd pushdminus pushdsilent pushdtohome
setopt HIST_REDUCE_BLANKS HIST_IGNORE_SPACE SHARE_HISTORY
setopt print_exit_value no_hup no_clobber
setopt extendedglob
setopt correct

mkcd() { mkdir -p "$1"; cd "$1"; }
mtar() { tarparms="$1"; shift; for fn in $@; do tar "$tarparms" "$fn"; done; }
otmux() { tmux attach-session -d -t "$1" || tmux new-session -s "$1"; }
sprunge() { 'curl -F '\''sprunge=<-'\'' http://sprunge.us'; }

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
