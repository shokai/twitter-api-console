#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'twitter'
require 'pp'
require 'yaml'
require 'rainbow'

begin
  conf = YAML::load open(File.dirname(__FILE__) + '/config.yml')
rescue
  STDERR.puts 'config.yaml load error'
  exit 1
end

Twitter.configure do |config|
  config.consumer_key = conf['twitter']['consumer_key']
  config.consumer_secret = conf['twitter']['consumer_secret']
  config.oauth_token = conf['twitter']['access_token']
  config.oauth_token_secret = conf['twitter']['access_secret']
end

if $0 == __FILE__
  require 'irb'
  IRB.start
end
