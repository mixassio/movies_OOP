require 'time'
require_relative 'movie_collection.rb'

class Netflix < MovieCollection
    HOURS_SHOW = {6..12 => {year: 1900..1945}, 
                  12..18 => {genre: ['Adventure', 'Comedy']}, 
                  18..24 => {genre: ['Drama', 'Horror']}, 
                  0..6 => nil}

    def show(user_time)
        select_time = Time.parse(user_time).strftime("%H").to_i
        field_for_filter = HOURS_SHOW.select{|el| el === select_time}.values.first
        raise('theater is closed')  unless field_for_filter
        key = field_for_filter.keys[0]
        val = field_for_filter.values[0]
        movies = @movies.select {|el| (Array(el.send(key)) & val.to_a).length > 0}
        movies.first
    end

    def when?(title_name)
        movie = self.filter(title: title_name)
    end
end