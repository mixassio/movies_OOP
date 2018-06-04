require_relative 'movie.rb'

class ModernMovie < Movie
  attr_reader :period
  def initialize(link, title, year, country, date, genre, time, rating, director, actors, owner)
    super
    @period = 'modern'
  end
  def to_s
    "#{@title} - современное кино: играют #{@actors.join(', ')}"
  end
  
  def cost
    3
  end
end
