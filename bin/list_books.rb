#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'kindle'

unless ARGV[0] && File.exists?(ARGV[0])
  puts "ERROR: need file"
  exit(-1)
end

Kindle::File.open(ARGV[0]).parse.books.sort.each do |book|
  puts book.title
  puts "- #{book.notes.length} notes"
  puts
end

