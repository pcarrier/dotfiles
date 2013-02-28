#!/usr/bin/env ruby

require 'time'
require 'rubygems'
require 'awesome_print'
require 'json'
require 'yaml'
require 'socket'

Pry.print = proc { |output, value| output.puts value.ai }
