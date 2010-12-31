module Kindle
  class BookAuthor
    def self.from_kindle_format(note)
      title_author, *notes = *note.split("\r\n")
      author_match = title_author.match(/\([^()]*\)$/) # "Title (something optional) (Author)"
      if author_match
        author = author_match[0]
      else
        author = ''
      end
      author
    end
  end
end
