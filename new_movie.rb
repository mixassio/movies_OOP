require_relative 'movie.rb'

class NewMovie < Movie

    def initialize(link, title, year, country, date, genre, time, rating, director, actors, owner) # rubocop:disable Metrics/MethodLength,Metrics/ParameterLists
        super
    end

    def to_s
        years = Date.today.strftime("%Y").to_i - @year
        "#{@title} - новинка, вышло #{years} лет назад!"
    end
end
