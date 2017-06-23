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
