require 'rubygems'
require 'couchrest'

module Kindle
  class Couch

    def self.add(book)
      if record = get(book) # update
        database.save_doc(book.to_document.merge('_rev' => record['_rev']))
      else
        database.save_doc(book.to_document)
      end
    end

    def self.get(book)
      begin
        rev = database.get(book.title)
      rescue RestClient::ResourceNotFound => nfe
        nil
      end
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
