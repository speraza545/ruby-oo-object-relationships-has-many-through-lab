
class Genre
    attr_accessor :name

    @@all = []

    def initialize(genre)
        @name = genre
        self.save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def songs
        Song.all.select{|song| song.genre == self}
    end

    def artists
        artists_uniq = []
        self.songs.map do |song|
            if song.genre == self
                artists_uniq << song.artist
            end
        end
        artists_uniq.uniq
    end
end
