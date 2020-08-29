require_relative './song.rb'
require_relative './artist.rb'

class MP3Importer
    attr_accessor :path

    def initialize (filepath)

        @path = filepath

    end

    def files

        files_standard_format = []
        files_arr = Dir.glob(File.join(self.path, '*.mp3'))
        files_arr.each do |file|
            files_standard_format << File.basename(file)
        end

        return files_standard_format

    end

    def import 

        self.files.each do |file|

            Song.new_by_filename(file)

        end

    end



end