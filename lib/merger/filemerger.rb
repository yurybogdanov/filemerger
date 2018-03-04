require 'merger/poster'
require 'merger/searcher'

module Merger
  class Filemerger
    def self.merge_files(config)
      first_mask_files = Searcher.find_files_for_mask(config.masks.first)
      first_mask_files.each do |first_mask_file|
        file_name = File.basename(first_mask_file).to_s.chomp(config.masks.first)

        content = ""
        config.masks.each do |mask|
          file = File.dirname(first_mask_file) + "/" + file_name + mask
          content += File.readlines(file).join() + "\n"
          delete_file_if_needed(file, config)
        end

        new_file_name = File.dirname(first_mask_file) + "/" + file_name + config.result_mask
        File.open(new_file_name, "w") { |f| f.puts content }
        puts "❇️  File #{new_file_name} created"
      end
    end

    private

    def self.delete_file_if_needed(file, config)
      if config.delete_old_files
        File.delete(file)
      end
    end
  end
end
