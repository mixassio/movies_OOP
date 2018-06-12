require_relative 'movie.rb'

module MoviesTheatre
  class NewMovie < Movie
    def to_s
      years = Date.today.strftime('%Y').to_i - @year
      "#{@title} - новинка, вышло #{years} лет назад!"
    end

    def cost
      5
    end
  end
end
