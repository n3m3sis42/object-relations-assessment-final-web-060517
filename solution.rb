# Please copy/paste all three classes into this file to submit your solution!

class Viewer
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    Rating.all.map {|rating| rating.viewer}.uniq
  end

  def self.find_by_name(name)
    self.all.find {|viewer| viewer.full_name == name}
  end

  def create_rating(score, movie)
    movie.is_a?(Movie) ? Rating.new(score, self, movie) : Rating.new(score, self, Movie.find_or_create_by_title(movie))
  end

end

class Rating
  attr_accessor :score, :viewer, :movie
  @@all = []

  def initialize(score, viewer, movie)
    @score = score
    @viewer = viewer
    @movie = movie
    @@all << self
  end

  def self.all
    @@all
  end

end

class Movie
  attr_accessor :title

  def initialize(title)
    self.title = title
  end

  def self.all
    Rating.all.map {|rating| rating.movie}.uniq
  end

  def self.find_by_title(title)
    self.all.find {|movie| movie.title == title}
  end


  def self.find_or_create_by_title(title)
    self.find_by_title(title.to_s) || self.new(title.to_s)
  end

  def ratings
    Rating.all.select {|rating| rating.movie == self}
  end

  def viewers
    self.ratings.map {|rating| rating.viewer}
  end

  def average_rating
    (self.ratings.map {|rating| rating.score}.inject(&:+) * 1.0 / self.ratings.size).round
  end

end
