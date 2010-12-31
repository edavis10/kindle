#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'kindle'
require 'kindle/couch'

views = {
  "_id" => "_design/books",
  "language" => 'javascript',
  "views" =>
  {
    "list" => {
      "map" => 'function(doc) { emit(doc._id, doc.title); }',
    }
  }
}

system("curl -X PUT 'http://127.0.0.1:5984/kindle/_design/books' -d '#{views.to_json}'")


