require_relative 'movie_collection.rb'

class Theatre < MovieCollection
  attr_reader :account
  def initialize(path)
    super
    @account = 0
  end
  def pay(money)
    @account = @account + money
  end
  def show(filters)
    movies = filter(filters)
    _, movie = movies.map{|movie| [movie.rating.to_f*rand(10), movie]}.max_by{|rating, movie| rating}
    current_time = Time.new
    raise('No money, put your account') if @account - movie.cost < 0
    
    @account = @account - movie.cost
    "Now showing: #{movie.title} #{current_time.strftime("%H:%M")} - #{(current_time + movie.time*60).strftime("%H:%M")}"
  end
  def how_much?(title_name)
    movie = filter(title: title_name).first
    movie.cost
  end
end
