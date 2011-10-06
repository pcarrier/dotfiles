all: .ssh/config

.ssh/config: .ssh/config.d
	cat .ssh/config.d/* > .ssh/config
