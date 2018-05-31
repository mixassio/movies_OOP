require 'time'
require_relative 'movie_collection.rb'

class Netflix < MovieCollection
    HOURS_SHOW = {6..12 => {year: 1900..1945}, 
                  12..18 => {genre: /Adventure|Comedy/}, 
                  18..24 => {genre: /Drama|Horror/}}
    def show(user_time)
        select_time = Time.parse(user_time).hour
        field_for_filter = HOURS_SHOW.select{|el| el === select_time}.values.first
        raise('theater is closed')  unless field_for_filter
        self.filter(field_for_filter)
    end

    def when?(title_name)
        sheadule = HOURS_SHOW.select { |key, val| 
            (self.filter(val) & self.filter(title: title_name)).length > 0
        }
        raise('this film is not in sheduale')  if sheadule.empty?
        p 'This film you can show in time:'
        sheadule.map{|key,val| key}.map{|el| "#{el.first}:00 - #{el.last}:00"} 
    end
end