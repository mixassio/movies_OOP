class Movie
    attr_reader :link, :title, :year, :country, :date, :genre, :time, :rating, :director, :actors, :month
    attr_accessor :genres_collections
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
      @genres_collections = owner.genres
    end
    def month 
        Date.parse(date).strftime('%B') if date.length == 10
    end
    def to_s
        "#{@title} (#{@date}; #{@genre}) - #{@time}"
    end
    def has_genre?(genre_find)
        raise "Your genres not found" unless @genres_collections.include?(genre_find)
        @genre.include?(genre_find)
    end
    def matches?(key, val)
        field = self.send(key)
        Array(field).any? {|le| val === le}
    end
end

