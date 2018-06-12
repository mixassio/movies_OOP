require_relative 'movie.rb'

module MoviesTheatre
  class AncientMovie < Movie
    def to_s
      "#{@title} - старый фильм (#{@year} год)"
    end

    def cost
      1
    end
  end
end
