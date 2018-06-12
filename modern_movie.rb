require_relative 'movie.rb'

module MoviesTheatre

class ModernMovie < Movie
  def to_s
    "#{@title} - современное кино: играют #{@actors.join(', ')}"
  end

  def cost
    3
  end
end
end