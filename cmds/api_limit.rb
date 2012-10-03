#!/usr/bin/env ruby
require File.expand_path '../api_console', File.dirname(__FILE__)

puts Twitter.rate_limit_status.remaining_hits
