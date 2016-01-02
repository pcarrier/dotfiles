#!/usr/bin/env ruby

def name n
	type = n['type']
	name = n['name']
	
	if type == 'con'
		name or "<#{n['layout']}>"
	else
		"[#{type} #{name}]"
	end
end

def describe n, l
	prefix = n['focused'] ? '*' : ' '
	prefix + ' ' * l + name(n)
end

def folded? n
	n['type'] == 'root' or
	# whatever the f* that thing is
	(n['type'] == 'con' && n['name'] == 'content')
end

def hidden? n
	case n['type']
	when 'output' then n['name'] == '__i3'
	when 'dockarea' then true
	else false
	end
end

def walk n, l = 0
	unless folded? n
		puts describe n, l
		l += 1
	end
	
	n['nodes'].each do |c|
		walk c, l unless hidden? c
	end
end 

require 'json'
t = JSON::parse `i3-msg -t get_tree`

require 'json'
walk JSON::parse ARGF.read