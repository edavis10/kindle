#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'kindle'

unless ARGV[0] && File.exists?(ARGV[0])
  puts "ERROR: need file"
  exit(-1)
end

kindle_file = Kindle::File.open(ARGV[0]).parse
kindle_file.books.sort.each do |book|
  puts book.title + " with #{book.notes.length} notes"
end

