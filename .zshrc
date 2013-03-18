bindkey -e vi

zmodload -a colors
zmodload -a autocomplete
autoload -U age && age

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

zmodload zsh/complist

[ -x /usr/bin/dircolors ] && eval $(dircolors)
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose true
zstyle ':completion:*' extra-verbose true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate

autoload -Uz compinit && compinit

setopt autocd autopushd pushdminus pushdsilent pushdtohome
setopt HIST_REDUCE_BLANKS HIST_IGNORE_SPACE SHARE_HISTORY inc_append_history
setopt no_hup no_clobber print_exit_value
setopt extendedglob glob_dots
setopt correct
setopt completealiases
setopt prompt_subst

case $TERM in
    rxvt|*term)
        precmd() { print -Pn "\e]0;%m:%~\a" }
        preexec () { print -Pn "\e]0;$1\a" }
    ;;
esac

autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[magenta]%}%1~ %{$fg[yellow]%}\$(vcprompt -f '%b:%r ')%{$reset_color%}%# %{$reset_color%}"
RPS1="%{$fg[white]%}%M:%d%{$reset_color%}"

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

alias sshow="opshost show"
alias vin="sublime"
alias vinn="sublime -n"
alias dotgit="GIT_DIR=$HOME/repos/dotfiles.git GIT_WORK_TREE=$HOME git"
alias dottig="GIT_DIR=$HOME/repos/dotfiles.git GIT_WORK_TREE=$HOME tig"
alias lf="awk -F '{print $NF}'"
alias ag="ag -a"

alias -g G='|egrep'
alias -g S='|sort'
alias -g L='|less'

hash -d logs="/var/log"
hash -d ssd="/media/ssd"
hash -d hdd="/media/hdd"
hash -d spotifiles="/media/spotifiles"

bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
bindkey '\e[3~' delete-char

mkcd() { mkdir -p "$1"; cd "$1"; }
mtar() { tarparms="$1"; shift; for fn in $@; do tar "$tarparms" "$fn"; done; }
otmux() { tmux attach-session -d -t "$1" || tmux new-session -s "$1"; }
sprunge() { curl -F 'sprunge=<-' http://sprunge.us; }

autoload -Uz compinit && compinit

HISTFILE="$HOME/.history"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
source $HOME/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls="ls -liFG"
alias d="ssh debian"
alias git=hub

source /usr/local/opt/chruby/share/chruby/chruby.sh
RUBIES=(~/.rubies/*)
chruby 2.0

source $HOME/repos/go/misc/zsh/go

function aman() {
	man -t "$@" | open -f -a /Applications/Preview.app
}
