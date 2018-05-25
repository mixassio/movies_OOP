require_relative 'movie.rb'

class ClassicMovie < Movie

    def to_s
        count_movies = @owner.filter(director: @director).length
        "#{@title} - классический фильм, режиссер #{@director} (#{count_movies})"
    end
end

