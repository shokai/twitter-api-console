#!/usr/bin/env ruby
require File.dirname(__FILE__)+'/../api_console'

puts Twitter.rate_limit_status.remaining_hits
