#!/usr/bin/env ruby

%w[rubygems time uri awesome_print json yaml socket].each {|m| require m}
Pry.print = proc { |output, value| output.puts value.ai }
