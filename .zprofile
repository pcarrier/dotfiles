[ -r /etc/profile ] && source /etc/profile

PATH=$HOME/bin:$HOME/usr/bin:$PATH:/opt/groovyserv/bin/

EDITOR=vim
PAGER=less

ARCHFLAGS="-arch x86_64" #... -arch i386"

PKG_PATH=http://ftp.spline.de/pub/OpenBSD/4.9/packages/amd64/
CVSROOT=anoncvs@anoncvs.fr.openbsd.org:/cvs

HISTFILE=$HOME/.history
HISTSIZE=1048576
SAVEHIST=1048576

autoload -U colors
colors
PS1="%{%B$fg[green]%}%n%{$reset_color%B%}@%{$fg[blue]%}%m %{%b$fg[yellow]%}%1~ %{$reset_color%}%# "
RPS1="%M:%d"

export PATH PKG_PATH PAGER CVSROOT EDITOR HISTFILE HISTSIZE SAVEHIST ARCHFLAGS PS1 RPS1
