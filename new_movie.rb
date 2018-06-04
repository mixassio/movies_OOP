require_relative 'movie.rb'

class NewMovie < Movie
  attr_reader :period
  def initialize(link, title, year, country, date, genre, time, rating, director, actors, owner)
    super
    @period = 'new'
  end

  def to_s
    years = Date.today.strftime('%Y').to_i - @year
    "#{@title} - новинка, вышло #{years} лет назад!"
  end

  def cost
    5
  end
end
