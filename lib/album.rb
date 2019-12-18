class Album
  attr_reader :id, :name, :year, :genre, :artist #Our new save method will need reader methods.

  @@albums = {}
  @@total_rows = 0 # We've added a class variable to keep track of total rows and increment the value when an ALbum is added.

  def initialize(name, artist, year, genre, id) # We've added id as a second parameter.
    @name = name
    @artist = artist
    @year = year
    @genre = genre
    @id = id || @@total_rows += 1  # We've added code to handle the id.
  end

  def self.all
    @@albums.values().sort { |a, b| a.name.downcase <=> b.name.downcase}
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.artist, self.year, self.genre, self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def self.search(x)
    @@albums.values().select { |element| /#{x}/i.match? element.name}
  end

  def update(name, artist, year, genre)
    if name != ""
      @name = name
    end
    if artist != ""
      @artist = artist
    end
    if year != ""
      @year = year
    end
    if genre != ""
      @genre = genre
    end
  end

  def delete
    @@albums.delete(self.id)
  end
end
