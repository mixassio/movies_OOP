require_relative 'movie.rb'

class ClassicMovie < Movie

    def initialize(link, title, year, country, date, genre, time, rating, director, actors, owner) # rubocop:disable Metrics/MethodLength,Metrics/ParameterLists
        super
    end

    def to_s
        list_movies = @owner.filter(director: @director).map{|el| el.title}.select{|el| el != @title}.join(', ')
        "#{@title} - классический фильм, режиссер #{@director} (#{list_movies})"
    end
end

