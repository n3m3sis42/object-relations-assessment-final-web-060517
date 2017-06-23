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
