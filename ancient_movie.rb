require_relative 'movie.rb'

class AncientMovie < Movie
  attr_reader :period
  def initialize(link, title, year, country, date, genre, time, rating, director, actors, owner)
    super
    @period = 'ancient'
  end
  def to_s
    "#{@title} - старый фильм (#{@year} год)"
  end
  def cost
    1
  end
end
