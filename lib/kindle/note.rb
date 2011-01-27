module Kindle
  class Note
    attr_accessor :content
    attr_accessor :location

    def content
      (@content || '').strip
    end

    def self.from_kindle_format(raw_note)
      title_author, highlight, *notes = *raw_note.split("\r\n")
      
      note = Note.new
      location = highlight.match(/loc. (\d*)/i)
      note.location = location[1].to_i if location
      note.content = notes.join("\r\n")
      note
    end

    def <=>(other)
      location <=> other.location
    end
    
  end
end
