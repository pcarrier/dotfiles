set -gx EDITOR emacsclient
set -gx ALTERNATE_EDITOR emacs
set -gx VISUAL emacsclient
set -gx HOSTNAME (hostname)
set -gx GOPATH $HOME/go

keychain --quiet --inherit any
test -f $HOME/.keychain/$HOSTNAME-fish; and . $HOME/.keychain/$HOSTNAME-fish
test -f $HOME/.keychain/$HOSTNAME-fish-gpg; and . $HOME/.keychain/$HOSTNAME-fish-gpg

set PATH $HOME/.rbenv/bin $HOME/.rbenv/shims $HOME/go/bin $HOME/bin /usr/local/share/npm/bin /usr/local/share/python /opt/X11/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin
rbenv rehash >/dev/null ^&1
