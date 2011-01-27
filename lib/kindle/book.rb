module Kindle
  class Book
    include Enumerable
    
    attr_accessor :title
    attr_accessor :raw_notes
    attr_accessor :author
    
    def to_s
      "<Kindle::Book title=#{@title} >"
    end

    def <=>(v)
      self.title <=> v.title
    end

    def notes
      raw_notes.sort
    end

    def last_updated
      return '' if raw_notes.empty?
      notes.last.added
    end

    def to_document
      {
        '_id' => @title,
        :title => @title,
        :author => @author,
        :notes => notes.collect {|note| "* #{note.content}"}
      }
    end

    def self.parse_from_kindle(kindle_note)
      book = Book.new
      book.title = BookTitle.from_kindle_format(kindle_note)
      book.author = BookAuthor.from_kindle_format(kindle_note)
      book.raw_notes ||= []
      book
    end

    def self.parse(content)
      book = Book.new
      book.title = content
      book
    end
  end

end
