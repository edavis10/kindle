module Kindle
  class Book
    attr_accessor :title
    attr_accessor :notes
    
    def to_s
      "<Kindle::Book title=#{@title} >"
    end

    def self.parse(content)
      book = Book.new
      book.title = content
      book
    end
  end
end
