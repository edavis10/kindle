module Kindle
  class Note
    attr_accessor :content

    def content
      (@content || '').strip
    end

    def self.from_kindle_format(raw_note)
      title_author, highlight, *notes = *raw_note.split("\r\n")
      
      note = Note.new
      note.content = notes.join("\r\n")
      note
    end
    
  end
end
