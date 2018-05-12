class Movie
    attr_accessor :link, :title, :year, :country, :date, :zhanre, :time, :rating, :director, :actors, :month

    def initialize(link, title, year, country, date, zhanre, time, rating, director, actors)
      @link = link
      @title = title
      @year = year
      @country = country
      @date = date
      @zhanre = zhanre.split(',')
      @time = time
      @rating = rating
      @director = director
      @actors = actors.split(',')
      @month = date.length == 10 ? Date.parse(date).strftime("%B") : nil
    end
    def to_s
        "#{@title} (#{@date}; #{@zhanre}) - #{@time}"
    end
    def has_genre?(zhanre_find)
        @zhanre.include? zhanre_find
    end
end




