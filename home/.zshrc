#!/bin/zsh
disable -r time

zmodload -a autocomplete
autoload -U age && age
autoload -Uz compinit && compinit
setopt autocd autopushd pushdminus pushdsilent pushdtohome
setopt HIST_REDUCE_BLANKS HIST_IGNORE_SPACE SHARE_HISTORY inc_append_history
setopt no_hup no_clobber print_exit_value
setopt extendedglob glob_dots
setopt correct
setopt no_complete_aliases
setopt prompt_subst
autoload -U colors && colors

# ctrl-left/right
bindkey -e
autoload -U edit-command-line &&
zle -N edit-command-line &&
bindkey '\C-x\C-e' edit-command-line
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

prompt_path() { print -n "$PWD" | sed -e "s|^$HOME|~|" -e 's|^/private||' -e 's-\([^/]\{3\}\)[^/]*/-\1/-g'; }
PS1="%(0?..%{$fg_bold[red]%}%? )"\
"%(1j.%{$fg_bold[yellow]%}%jj .)"\
"%{$fg_bold[blue]%}%n"\
"%{$reset_color%}@"\
"%{$fg_bold[yellow]%}%m "\
"%{$fg_bold[magenta]%}\$(prompt_path) "\
"%{$fg_no_bold[yellow]%}\$(vcprompt -f '%b ')"\
"%{$reset_color%}%# "

hash -d s=$HOME/src
hash -d S=~s/source
hash -d mh=~S/science/src/python/twitter/manhattan/frontend
hash -d clu=~S/science/src/scala/com/twitter/clutch
hash -d clut=~S/science/test/scala/com/twitter/clutch
hash -d gm=~S/birdcage/gizzmo
hash -d gz=~S/birdcage/gizzard
hash -d m=/run/media/$USER

hash -d l=/usr/local
hash -d o=$HOME/opt

git()     { time hub "$@"; }
lf()      { awk -F '{print $NF;}'; }
mkcd()    { mkdir -p "$1"; cd "$1"; }
gr()      { ./gradlew "$@"; }
aman()    { man -t "$@" | open -f -a Preview; }
d()       { dmesg -H }
e()       { emacsclient --quiet --no-wait "$@"; }
sprunge() { curl -F 'sprunge=<-' http://sprunge.us; }
clp()     { PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin "$@" }
buck()    { ~s/buck/bin/buck "$@"; }
pac()     { apacman "$@"; }
s()       { sudo "$@"; }
sys()     { s systemctl "$@"; }
jou()     { s journalctl "$@"; }

grc() { git rebase --continue; }
gri() { git rebase --interactive "$@"; }
gra() { git rebase --abort; }
grf() { git show $(<.git/rebase-merge/stopped-sha); }
dl()  { aria2c --continue -j4 -x4 --stream-piece-selector=inorder --min-split-size=1M "$@"; }

if [[ Darwin = $OS ]]
then
  ls()  { command gls -liF --color=auto "$@"; }
else
  ls() { command ls -liF --color=auto "$@"; }
  open () { xdg-open "$@"; }
fi

csalias() { alias $1="ssh nest1 $1" }
csalias loony

uname -a|cowsay -nf small

source ~s/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
