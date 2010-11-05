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
        book_title = BookTitle.from_kindle_format(raw_note)
        books[book_title] ||= []
        books[book_title] << Note.from_kindle_format(raw_note)
      end
      
      books.each do |title, notes|
        @books ||=[]
        book = Book.new
        book.title = title
        book.notes = notes
        @books <<  book
      end
      
      self
    end
    
  end
end
