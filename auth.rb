#!/usr/bin/env ruby
require File.expand_path 'bootstrap.rb', File.dirname(__FILE__)

consumer = OAuth::Consumer.new(Conf['twitter']['consumer_key'], Conf['twitter']['consumer_secret'],
                               :site => "http://twitter.com/")

request_token = consumer.get_request_token

puts 'please access following URL and approve'
puts "#{request_token.authorize_url}".color(:magenta).underline
system "open #{request_token.authorize_url}"

print 'then, input OAuth Verifier: '
oauth_verifier = gets.chomp.strip

access_token = request_token.get_access_token(:oauth_verifier => oauth_verifier)

Conf['twitter']['access_token'] = access_token.token
Conf['twitter']['access_secret'] = access_token.secret

Conf.save

puts 'authorized!!'.color(:green)
puts ' => config.yml'
