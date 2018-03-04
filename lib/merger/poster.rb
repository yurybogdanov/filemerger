require 'colorize'

module Merger
  class Poster
    def self.post_greeting
      puts "====================== MERGER 👨‍💻  ======================".colorize(:green)
      puts "Preparing for files merging...".colorize(:green)
    end

    def self.post_data_acquired
      puts "Mergefile.json has been read..."
    end

    def self.post_searching
      puts "Searching for specified files..."
    end

    def self.post_search_completed(pattern, count)
      puts "Found #{count} file(s) matching #{pattern}"
    end

    def self.post_created_file(file_name)
      puts "Created merged file #{file_name}"
    end

    def self.post_file_not_found(file)
      puts "Couldn't find file #{file}".colorize(:red)
    end

    def self.post_merge_finished
      puts "The merge has been successfuly completed.".colorize(:green)
    end
  end
end
