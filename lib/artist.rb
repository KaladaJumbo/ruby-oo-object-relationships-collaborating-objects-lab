require_relative './song.rb'

class Artist

    attr_accessor :name
    @@all = []

    def initialize (name)

        @name = name
        self.save

    end

    def self.all

        @@all

    end

    def save

        Artist.all << self

    end

    def songs

        Song.all.select do |int_song|

            int_song.artist == self

        end

    end

    def add_song (song)

        song.artist = self

    end

    def self.find_or_create_by_name(name)

        result = Artist.all.find do |int_artist|
           
            int_artist.name == name 
                
        end

        if result == nil
            new_int = Artist.new(name)
            return new_int
        else
            return result
        end 
            
    end

    def print_songs

       self.songs.each {|int_song| puts int_song.name} 

    end

    # def self.am_i_there?(int_artist)

    #     Artist.all.include?(int_artist)

    # end

end