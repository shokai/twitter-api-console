#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'oauth'
require 'rainbow'
require 'yaml'

begin
  conf = YAML::load open(File.dirname(__FILE__) + '/config.yml')
rescue
  STDERR.puts 'config.yaml load error'
  exit 1
end

consumer = OAuth::Consumer.new(conf['twitter']['consumer_key'], conf['twitter']['consumer_secret'],
                               :site => "http://twitter.com/")

request_token = consumer.get_request_token

puts 'please access following URL and approve'
puts "#{request_token.authorize_url}".color(:magenta).underline
system "open #{request_token.authorize_url}"

print 'then, input OAuth Verifier: '
oauth_verifier = gets.chomp.strip

access_token = request_token.get_access_token(:oauth_verifier => oauth_verifier)

conf['twitter']['access_token'] = access_token.token
conf['twitter']['access_secret'] = access_token.secret

open(File.dirname(__FILE__)+'/config.yml', 'w+'){|f|
  f.puts conf.to_yaml
}

puts 'authorized!!'.color(:green)
puts ' => config.yml'
