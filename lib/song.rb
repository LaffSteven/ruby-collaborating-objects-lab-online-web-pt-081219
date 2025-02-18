class Song 

  attr_accessor :name, :artist, :songs 

  @@all = []

  def initialize(name = @name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    new_artist = Artist.find_or_create_by_name(name)
    new_artist.add_song(self)
    new_artist
  end

  def self.new_by_filename(filename)
    song = self.new(filename.split(" - ")[1])
    song.artist_name = filename.split(" - ")[0]
    song
  end
end