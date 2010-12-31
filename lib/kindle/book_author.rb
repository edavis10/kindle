module Kindle
  class BookAuthor
    def self.from_kindle_format(note)
      title_author, *notes = *note.split("\r\n")
      # "Title (something optional) (Author)" =>
      #   "Author"
      author_match = title_author.match(/\(([^()]*)\)$/)
      if author_match
        author = author_match[1]
      else
        author = ''
      end
      author
    end
  end
end
