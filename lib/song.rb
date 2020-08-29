require_relative './artist.rb'

class Song 

    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize (name)

        @name = name 
        self.save

    end

    def save 

        Song.all << self

    end

    def self.all

        @@all

    end

    def self.new_by_filename(filename)

        filename_info = filename.split(" - ")
        int_song = Song.new(filename_info[1])
        int_song.artist = Artist.find_or_create_by_name(filename_info[0])
        filename_info[2].slice!(".mp3")
        int_song.genre = filename_info[2]
        return int_song

    end


    def artist_name= (name)

        self.artist = Artist.find_or_create_by_name(name)

    end

end