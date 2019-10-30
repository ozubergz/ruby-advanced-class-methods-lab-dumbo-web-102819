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
     b.name <=> a.name
    }
  end

end
