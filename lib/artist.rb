class Artist
    attr_accessor :name, :genre

    @@all = []

    def initialize(name)
        @name = name
        self.save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def new_song(name, genre)
        new_song = Song.new(name, self, genre)
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def genres
        self.songs.map do |song|
            song.genre
        end
    end
end
