[ -r /etc/profile ] && source /etc/profile

PATH=$HOME/bin:$HOME/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin

EDITOR=vim
PAGER=less

ARCHFLAGS="-arch x86_64" #... -arch i386"

PACKAGEROOT=ftp://ftp.se.FreeBSD.org
PKG_PATH=http://ftp.spline.de/pub/OpenBSD/4.9/packages/amd64/
CVSROOT=anoncvs@anoncvs.fr.openbsd.org:/cvs

HISTFILE=$HOME/.history
HISTSIZE=1048576
SAVEHIST=1048576


_JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"


export PATH PACKAGEROOT PKG_PATH PAGER CVSROOT EDITOR HISTFILE HISTSIZE SAVEHIST ARCHFLAGS _JAVA_OPTIONS
