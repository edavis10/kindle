module Kindle
  class BookTitle
    def self.from_kindle_format(note)
      title_author, *notes = *note.split("\r\n")
      # "Title (something optional) (Author)" =>
      #   "Title (somethine optional)"
      title_match = title_author.match(/(.*)\(.*\)$/)
      if title_match
        title = title_match[1].strip
      else
        title = ''
      end
      title
    end
  end
end
