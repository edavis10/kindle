require 'rubygems'
require 'couchrest'

module Kindle
  class Couch

    def self.add(book)
      database.save_doc(book.to_document)
    end

    def self.database
      @db ||= create_database
    end

    private
    
    def self.create_database
      @db = CouchRest.database!("http://127.0.0.1:5984/kindle")
    end
  end
end
