class Movie
    attr_reader :link, :title, :year, :country, :date, :genre, :time, :rating, :director, :actors, :month, :owner

    def initialize(link, title, year, country, date, genre, time, rating, director, actors, owner)
      @link = link
      @title = title
      @year = year.to_i
      @country = country
      @date = date
      @genre = genre.split(',')
      @time = time
      @rating = rating
      @director = director
      @actors = actors.split(',')
      @owner = owner.genres
    end
    def month 
        Date.parse(date).strftime('%B') if date.length == 10
    end
    def to_s
        "#{@title} (#{@date}; #{@genre}) - #{@time}"
    end
    def has_genre?(genre_find)
        answer = (@owner.include? genre_find) ? (@genre.include? genre_find) : 'genres not found'
    end
end




