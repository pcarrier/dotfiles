PATH="$HOME/bin:$HOME/go/bin:$HOME/repos/go/bin:/usr/local/share/npm/bin:/opt/X11/bin:/usr/texbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

if [ -d /etc/profile.d ]; then
for f in /etc/profile.d/*.sh; do
	. $f
done
fi

EDITOR=vim
TERMINAL=terminator

HISTSIZE=1048576
SAVEHIST=1048576

DEBFULLNAME='Pierre Carrier'
DEBEMAIL='pierre@gcarrier.fr'

GOPATH="$HOME/go"
GOROOT="$HOME/repos/go"

SYSTEM=$(uname -s)

export PATH EDITOR PAGER TERMINAL HISTSIZE SAVEHIST DEBFULLNAME DEBEMAIL GOPATH GOROOT SYSTEM
eval $(keychain --quiet --eval)
