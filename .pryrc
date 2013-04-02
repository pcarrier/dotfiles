#!/usr/bin/env ruby

%w[rubygems time uri awesome_print json yaml socket aws awscreds open-uri nokogiri].each {|m| require m}
Pry.print = proc { |output, value| output.puts value.ai }

AWS.config AWSCreds::Store.new.default_creds.to_hash
