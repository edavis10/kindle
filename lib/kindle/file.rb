module Kindle
  class File
    attr_accessor :data
    attr_accessor :books
    
    def self.open(file)
      kindle_file = new
      kindle_file.data = ::File.read(file)
      kindle_file
    end

    def parse
      # Tmp data
      books = {}
      
      @data.split("==========\r\n").each do |raw_note|
        book = Book.parse_from_kindle(raw_note)

        books[book.title] ||= book
        books[book.title].notes << Note.from_kindle_format(raw_note)
      end

      @books = books.values
      
      self
    end
    
  end
end
