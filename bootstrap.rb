require 'rubygems'
require 'bundler/setup'
require 'oauth'
require 'rainbow'
require 'yaml'

class Bootstrap
  def self.default
    []
  end

  def self.init(*inits)
    [default, inits].flatten.uniq.each do |cat|
      Dir.glob("#{File.dirname(__FILE__)}/#{cat}/*.rb").each do |rb|
        puts "load #{rb}"
        require rb
      end
    end
  end
end

class Conf
  def self.[](key)
    ENV[key] || conf[key]
  end

  def self.[]=(key,value)
    conf[key] = value
  end

  def self.conf_file
    File.dirname(__FILE__)+'/config.yml'
  end

  def self.conf
    begin
      @@conf ||= YAML::load self.open_conf_file.read
    rescue => e
      STDERR.puts e
      STDERR.puts "config.yml load error!!"
      exit 1
    end
  end

  def self.save
    open(self.conf_file, 'w+') do |f|
      f.write self.to_yaml
    end
  end

  def self.open_conf_file(opt=nil, &block)
    if block_given?
      yield open(self.conf_file, opt)
    else
      return open(self.conf_file, opt)
    end
  end

  def self.to_yaml
    self.conf.to_yaml
  end
end
