#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'kindle'
require 'kindle/couch'

unless ARGV[0] && File.exists?(ARGV[0])
  puts "ERROR: need file"
  exit(-1)
end

Kindle::File.parse_books(ARGV[0]).each do |book|
  Kindle::Couch.add(book)
end
