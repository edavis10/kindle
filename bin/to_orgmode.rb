#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'kindle'
require "kindle/org_mode"
require 'fileutils'

unless ARGV[0] && File.exists?(ARGV[0])
  puts "ERROR: need kindle notes file"
  exit(-1)
end

unless ARGV[1]
  puts "ERROR: need destination directory"
  exit(-1)
end

destination_path = ARGV[1]
FileUtils.mkdir_p destination_path

Kindle::File.open(ARGV[0]).parse.books.sort.each do |book|
  Kindle::OrgMode.save(book, destination_path)
end
