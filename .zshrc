autoload -U compinit promptinit
compinit
promptinit
prompt walters

bindkey -e vi

zstyle ':completion:*' menu select
setopt completealiases

setopt autocd autopushd pushdminus pushdsilent pushdtohome
setopt noclobber
setopt HIST_REDUCE_BLANKS HIST_IGNORE_SPACE
setopt SH_WORD_SPLIT
setopt nohup

mkcd() { mkdir -p "$1"; cd "$1"; }
mtar() { tarparms="$1"; shift; for fn in $@; do tar "$tarparms" "$fn"; done; }
otmux() { tmux attach-session -d -t "$1" || tmux new-session -s "$1"; }
sprunge() { 'curl -F '\''sprunge=<-'\'' http://sprunge.us'; }
