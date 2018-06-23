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
    if Song.find_by_name(song) != nil
      return Song.find_by_name(song)
    else
      return Song.create_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by{ |object| object.name}
  end

  def self.new_from_filename(filename)
    filename = name.split(".")
    name_artist = filename[0].split("-")
    song = Song.create_by_name(name_artist[1])
    song.artist_name = name_artist[0]
    return song
  end

end
