#!/usr/bin/env ruby

require 'bundler/inline'

# Be wary of requiring gems at startup - the more we add, the slower
# this command gets to load. Instead require them wherever they're instantiated or used.
# This way the load time penalty for any gem is limited to commands where that gem is
# actually used.
#
# It's perfectly valid Ruby to put a require inside a method definition, EG:
#
# def thing
#   require "redis"
#   Redis.new
# end
#
gemfile do
  source 'https://rubygems.org'
  gem "phlexing", "~> 0.6.0"
end

def convert_erb(input)
  Phlexing::Converter.convert(input, component: true)
end

input_file = ARGV[0]

if !STDIN.tty?
  input_erb = STDIN.read
  puts convert_erb(input_erb)
  exit
end

if input_file.nil?
  puts "Usage: `phlexing.rb <input_file>.[erb|html]` or `echo 'erb_string' | phlexing.rb`"
  puts
  puts "To write to a file just pipe the output: `phlexing.rb <input_file>.[erb|html] > output_file.rb`"
  puts
  puts "If you're on MacOS, you can also pipe the clipboard into this command to convert its contents: `pbpaste | phlexing.rb`"
  puts "(handy for converting from tailwind example code or whatever)"
  exit 1
end

extension = File.extname(input_file)

if extension == ".erb" || extension == ".html"
  contents = File.read(input_file)
  puts convert_erb(contents)
else
  puts "File must have a .erb extension"
  exit 1
end
