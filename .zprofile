PATH=$HOME/bin:$HOME/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/X11/bin:/usr/games:.

EDITOR=vim
PAGER=less

ARCHFLAGS="-arch x86_64" #... -arch i386"

PKG_PATH=http://ftp.spline.de/pub/OpenBSD/4.9/packages/`machine`/
CVSROOT=anoncvs@anoncvs.fr.openbsd.org:/cvs

HISTFILE=$HOME/.history
HISTSIZE=1048576

PS1="%? %n@%B%m%b:%~%# "
RPS1="%D %T"

export PATH PKG_PATH PAGER CVSROOT EDITOR HISTFILE HISTSIZE ARCHFLAGS CLICOLOR PS1
