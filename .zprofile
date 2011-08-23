PATH=$HOME/bin:$HOME/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/X11/bin:/usr/games:.

EDITOR=vim
PAGER=less

ARCHFLAGS="-arch x86_64" #... -arch i386"

PKG_PATH=http://ftp.spline.de/pub/OpenBSD/4.9/packages/`machine`/
CVSROOT=anoncvs@anoncvs.fr.openbsd.org:/cvs

HISTFILE=$HOME/.history
HISTSIZE=1048576

autoload -U colors
colors
PS1="%{%B$fg[green]%}%n%{$reset_color%B%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$fg[red]%}%?%{$reset_color%B%}%# %{%b%}"
RPS1="%M:%d"

export PATH PKG_PATH PAGER CVSROOT EDITOR HISTFILE HISTSIZE ARCHFLAGS PS1 RPS1
