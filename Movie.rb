class Movie
    attr_reader :link, :title, :year, :country, :date, :genre, :time, :rating, :director, :actors, :month

    def initialize(link, title, year, country, date, genre, time, rating, director, actors)
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
    end
    def month 
        @date.length == 10 ? Date.parse(date).strftime("%B") : nil
    end
    def to_s
        "#{@title} (#{@date}; #{@genre}) - #{@time}"
    end
    def has_genre?(genre_find)
        @genre.include? genre_find
    end
end




