require_relative 'movie.rb'

class ModernMovie < Movie

    def initialize(link, title, year, country, date, genre, time, rating, director, actors, owner) # rubocop:disable Metrics/MethodLength,Metrics/ParameterLists
        super
    end

    def to_s
        "#{@title} - современное кино: играют #{@actors.join(', ')}"
    end
end
