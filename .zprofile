PATH="$HOME/bin:$HOME/go/bin:$HOME/repos/go/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

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

export PATH EDITOR PAGER TERMINAL HISTSIZE SAVEHIST DEBFULLNAME DEBEMAIL GOPATH
eval $(keychain --quiet --eval)
