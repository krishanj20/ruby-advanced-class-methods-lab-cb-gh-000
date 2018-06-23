class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    return @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(song)
    the_song = Song.find_by_name(song)
    if the_song.name == song
      Song.find_by_name(song)
    else
      return Song.create_by_name(song)
    end
  end
end
