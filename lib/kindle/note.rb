require 'rubygems'
require 'chronic'

module Kindle
  class Note
    attr_accessor :content
    attr_accessor :location
    attr_accessor :added

    def content
      (@content || '').strip
    end

    def self.from_kindle_format(raw_note)
      title_author, highlight, *notes = *raw_note.split("\r\n")
      
      note = Note.new
      location = highlight.match(/loc. (\d*)/i)       # Kindle 2nd Gen
      location ||= highlight.match(/Location (\d*)/i) # Kindle 4th Gen (touch)
      note.location = location[1].to_i if location

      # "Added on Wednesday, June 30, 2010, 10:35 PM"
      added_at = highlight.match(/Added on (.*), (.*), (.*), (.*)/)
      if added_at
        date = "#{added_at[2]} #{added_at[3]} at #{added_at[4]}"
        note.added = Chronic.parse(date)
      end
      note.content = notes.join("\r\n")
      note
    end

    def <=>(other)
      location <=> other.location
    end
    
  end
end
