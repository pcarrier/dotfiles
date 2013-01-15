PATH="$HOME/.gem/ruby/1.9.1/bin:$HOME/bin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/plan9/bin"

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

export PATH EDITOR PAGER TERMINAL HISTSIZE SAVEHIST DEBFULLNAME DEBEMAIL
eval $(keychain --quiet --eval)
