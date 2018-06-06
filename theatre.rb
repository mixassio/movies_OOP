require_relative 'movie_collection.rb'

class Theatre < MovieCollection
  HOURS_SHOW = { 6..12 => { year: 1900..1945 },
                 12..18 => { genre: /Adventure|Comedy/ },
                 18..24 => { genre: /Drama|Horror/ } }.freeze
  def show(user_time)
    select_time = Time.parse(user_time).hour
    _, filters = HOURS_SHOW.detect { |period, _value| period.cover?(select_time) }
    raise('theater is closed') unless filters
    movies = filter(filters)
    movie = get_random_movie(movies)
    print_show(movie)
  end

  def when?(title_name)
    movie = filter(title: title_name).first
    sheadule = HOURS_SHOW.select do |_key, val|
      filter(val).include?(movie)
    end
    raise('this film is not in sheduale') if sheadule.empty?
    puts 'This film you can show in time:'
    puts sheadule.keys.map { |el| "#{el.first}:00 - #{el.last}:00" }
  end
end
