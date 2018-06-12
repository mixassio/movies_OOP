require_relative 'movie_collection.rb'

module MoviesTheatre

class Theatre < MovieCollection
  include Cashbox

  HOURS_SHOW = { 6..12 => [3, { year: 1900..1945 }],
                 12..18 => [5, { genre: /Adventure|Comedy/ }],
                 18..24 => [10, { genre: /Drama|Horror/ }] }.freeze

  def buy_ticket(money, title)
    p "you bought a ticket on #{title}"
    pay_to_cash(money)
  end

  def show(user_time)
    select_time = Time.parse(user_time).hour
    _, (cost, filters) = HOURS_SHOW.detect { |period, _value| period.cover?(select_time) }
    raise('theater is closed') unless filters
    movies = filter(filters)
    movie = get_random_movie(movies)
    buy_ticket(cost, movie.title)
    print_show(movie)
  end

  def when?(title_name)
    movie = filter(title: title_name).first
    sheadule = HOURS_SHOW.select do |_key, (_, val)|
      filter(val).include?(movie)
    end
    raise('this film is not in sheduale') if sheadule.empty?
    puts 'This film you can show in time:'
    puts sheadule.keys.map { |el| "#{el.first}:00 - #{el.last}:00" }
  end
end
end