#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'erb'

config = Hashie::Mash.new
config.zygote = true
config.subnet = '172.17.8'
template = ERB.new(File.read(File.expand_path('../Vagrantfile.erb', __FILE__)), trim_mode: '-')
File.open(File.expand_path('../Vagrantfile', __FILE__), 'w') do |io|
  io << <<-EOF
# Automatically generated by generate.rb. DO NOT EDIT.
#
  EOF
  io << template.result(binding)
end
