require_relative 'movie.rb'

module MoviesTheatre
  class ClassicMovie < Movie
    def to_s
      count_movies = @owner.filter(director: @director).length
      "#{@title} - классический фильм, режиссер #{@director} (#{count_movies})"
    end

    def cost
      1.5
    end
  end
end
