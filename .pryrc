#!/usr/bin/env ruby

require 'rubygems'
require 'awesome_print'
require 'json'
require 'yaml'

Pry.print = proc { |output, value| output.puts value.ai }
