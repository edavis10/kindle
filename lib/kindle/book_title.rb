module Kindle
  class BookTitle
    def self.from_kindle_format(note)
      title_author, *notes = *note.split("\r\n")
      title_author
    end
  end
end
