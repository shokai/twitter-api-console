#!/usr/bin/env ruby
require File.expand_path 'bootstrap.rb', File.dirname(__FILE__)
require 'twitter'
require 'pp'

Twitter.configure do |config|
  config.consumer_key = Conf['twitter']['consumer_key']
  config.consumer_secret = Conf['twitter']['consumer_secret']
  config.oauth_token = Conf['twitter']['access_token']
  config.oauth_token_secret = Conf['twitter']['access_secret']
end

if $0 == __FILE__
  require 'irb'
  IRB.start
end
