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

RUBY_HEAP_MIN_SLOTS=600000
RUBY_GC_MALLOC_LIMIT=59000000
RUBY_HEAP_FREE_MIN=100000

export PATH EDITOR PAGER TERMINAL HISTSIZE SAVEHIST DEBFULLNAME DEBEMAIL GOPATH GOROOT SYSTEM RUBY_HEAP_MIN_SLOTS RUBY_GC_MALLOC_LIMIT RUBY_HEAP_FREE_MIN
eval $(keychain --quiet --eval)
