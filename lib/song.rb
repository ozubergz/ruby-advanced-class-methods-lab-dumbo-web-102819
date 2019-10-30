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
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    found_name = self.find_by_name(name)
    if(!found_name) 
      return create_by_name(name)
    else
      return found_name
    end
  end
  
  def self.alphabetical
    @@all.sort { |a, b|
     a.name <=> b.name
    }
  end
  
  def self.new_from_filename(name)
    splitted = name.split(/\s+-\s+|.mp3/)
    song = Song.new
    song.artist_name = splitted[0]
    song.name = splitted[1]
    song.save
    song
  end
  
  def self.create_from_filename(name)
    self.new_from_filename(name)
  end
  
  def self.destroy_all
    @@all.clear
  end

end
