require_relative 'movie.rb'

class ClassicMovie < Movie
  attr_reader :period
  def initialize(link, title, year, country, date, genre, time, rating, director, actors, owner)
    super
    @period = 'classic'
  end

  def to_s
    count_movies = @owner.filter(director: @director).length
    "#{@title} - классический фильм, режиссер #{@director} (#{count_movies})"
  end

  def cost
    1.5
  end
end
