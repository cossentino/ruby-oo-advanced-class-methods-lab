require "pry"

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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(str_name)
    song = self.new
    song.name = str_name
    song
  end

  def self.create_by_name(str_name)
    song = self.new
    song.name = str_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    file_array = filename.split(/\s-\s|\./)
    song = self.new
    song.name = file_array[1]
    song.artist_name = file_array[0]
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end
end



song = Song.new_from_filename("Thundercat - For Love I Come.mp3")