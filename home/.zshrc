#!/bin/zsh

disable -r time

zmodload -a autocomplete
autoload -U age && age
autoload -Uz compinit && compinit
setopt interactivecomments
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
"%(1j.%{$fg_no_bold[yellow]%}%jj .)"\
"%{$fg_no_bold[green]%}\$(prompt_path) "\
"%{$fg_no_bold[yellow]%}\$(vcprompt -f '%b ')"\
"%{$reset_color%}%# "

hash -d w=$HOME/ws
hash -d s=~w/src
hash -d m=~w/src/github.com/meteor
hash -d l=/usr/local
hash -d o=$HOME/opt
hash -d a=~m/amsterdam
hash -d c=~m/amsterdam-config
hash -d g=~m/galaxy-server
hash -d M=~m/meteor

git()     { hub "$@"; }
lf()      { awk -F '{print $NF;}'; }
mkcd()    { mkdir -p "$1"; cd "$1"; }
aman()    { man -t "$@" | open -f -a Preview; }
d()       { dmesg -H }
e()       { emacsclient --quiet --no-wait "$@"; }
sprunge() { curl -F 'sprunge=<-' http://sprunge.us; }
clp()     { PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin "$@" }
pac()     { sudo pacman "$@"; }
apac()    { apacman "$@"; }
chrome()  { google-chrome-beta "$@"; }
d8()      { rlwrap ~s/chromium.googlesource.com/v8/v8/out/Release/d8 "$@"; }
atom()    { atom-beta "$@"; }
apm()     { apm-beta "$@"; }
s()       { sudo "$@"; }
sys()     { s systemctl "$@"; }
jou()     { s journalctl "$@"; }
pac()     { s pacman "$@"; }
wut()     { pacman -Qo $(which $1); }

gr() { git rebase "$@"; }
grc() { git rebase --continue; }
gri() { git rebase --interactive "$@"; }
gra() { git rebase --abort; }
grf() { git show $(<.git/rebase-merge/stopped-sha); }
dl()  { aria2c --force-sequential --continue -j16 -x16 --stream-piece-selector=inorder --min-split-size=1M "$@"; }

gcd() {
  local u="$1"
  local p=~s/"$(echo "$u" | sed \
          -e 's_.*://__' \
          -e 's_.*@__' \
          -e 's_:_/_' \
          -e 's/\.git$//' \
          )"
  if [[ -e "$p" ]]; then
    cd "$p"
  else
    local pa="$(dirname "$p")"
    mkdir -p "$pa"; cd "$pa"
    git clone "$u"
    cd "$p"
  fi
}
ghcd() { gcd "git@github.com:$1"; }
pcd() { ghcd "pcarrier/$1"; }
mcd() { ghcd "meteor/$1"; }

if [[ Darwin = $OS ]]
then
  ls()  { command gls -liF --color=auto "$@"; }
else
  ls() { command ls -liF --color=auto "$@"; }
  open () { xdg-open "$@"; }
fi

ifsource() { [ -e "$1" ] && . "$1"; }
ifsource /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
