PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

for f in /etc/profile.d/*.sh; do
	. $f
done

EDITOR=vim
TERMINAL=terminator

HISTFILE=$HOME/.history
HISTSIZE=1048576
SAVEHIST=1048576

DEBFULLNAME='Pierre Carrier'
DEBEMAIL='pierre@spotify.com'

export PATH EDITOR PAGER TERMINAL HISTFILE HISTSIZE SAVEHIST DEBFULLNAME DEBEMAIL
eval $(keychain --quiet --eval)
