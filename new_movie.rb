require_relative 'movie.rb'

class NewMovie < Movie

    def to_s
        years = Date.today.strftime("%Y").to_i - @year
        "#{@title} - новинка, вышло #{years} лет назад!"
    end
end
