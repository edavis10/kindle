module Kindle
  class OrgMode
    def self.save(book, path)
      filename = path + "/" + book.to_file_name + ".org"

      ::File.open(filename, 'w') do |file|
        file.puts("* #{book.title}\n\n")
        file.puts("Author: #{book.author}")
        file.puts("Last updated: #{book.last_updated}")

        file.puts("\n** Notes \n")
        book.notes.each do |note|
          file.puts(note.content.to_s + "\n")
        end
      end
      
      
    end
  end
end
