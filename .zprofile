PATH="$HOME/bin:$HOME/go/bin:$HOME/repos/go/bin:/usr/local/share/npm/bin:/usr/local/share/python:/opt/X11/bin:/usr/texbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

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

JAVA_HOME="$(/usr/libexec/java_home)"
EC2_PRIVATE_KEY="$HOME/.crypto/ec2-private.pem"
EC2_CERT="$HOME/.crypto/ec2-cert.pem"
EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

export PATH EDITOR PAGER TERMINAL HISTSIZE SAVEHIST DEBFULLNAME DEBEMAIL GOPATH GOROOT SYSTEM RUBY_HEAP_MIN_SLOTS RUBY_GC_MALLOC_LIMIT RUBY_HEAP_FREE_MIN JAVA_HOME EC2_PRIVATE_KEY EC2_CERT EC2_HOME

eval $(keychain --quiet --eval)
