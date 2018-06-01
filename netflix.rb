require 'time'
require_relative 'movie_collection.rb'

class Netflix < MovieCollection
  HOURS_SHOW = { 6..12 => { year: 1900..1945 },
                 12..18 => { genre: /Adventure|Comedy/ },
                 18..24 => { genre: /Drama|Horror/ } }.freeze
  def show(user_time)
    select_time = Time.parse(user_time).hour
    _, filters = HOURS_SHOW.detect{|period, value| period.cover?(select_time) }
    raise('theater is closed') unless filters
    filter(filters)
  end

  def when?(title_name)
    movie = filter(title: title_name).first
    sheadule = HOURS_SHOW.select { |key, val|
      filter(val).include?(movie)
    }
    raise('this film is not in sheduale') if sheadule.empty?
    p 'This film you can show in time:'
    sheadule.map { |key, _val| key }.map { |el| "#{el.first}:00 - #{el.last}:00" }
  end
end
