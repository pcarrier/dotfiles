#!/usr/bin/env ruby

%w[rubygems time uri awesome_print json yaml socket aws fog aws/creds open-uri nokogiri msgpack].each {|m| require m}
Pry.print = proc { |output, value| output.puts value.ai }

AWS.config AWS::Creds[:default].to_hash
