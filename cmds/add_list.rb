#!/usr/bin/env ruby
require File.expand_path '../api_console', File.dirname(__FILE__)

if ARGV.size != 2
  puts 'Argument Error'.color(:red)
  puts "e.g.  ruby #{$0} user_name list_name"
  exit 1
end

user = ARGV.shift
list = ARGV.shift

puts "add #{user} into list:#{list}"

if Twitter.list_add_member(list, user)
  puts 'success!'.color(:green)
else
  STDERR.puts 'fail'.color(:red)
end
