require 'time'
require_relative 'movie_collection.rb'

class Netflix < MovieCollection
  attr_reader :account
  def initialize(path)
    super
    @account = 0
  end

  def pay(money)
    @account += money
  end

  def show(filters)
    movies = filter(filters)
    movie = get_random_movie(movies)
    raise('No money, put your account') if @account - movie.cost < 0
    @account -= movie.cost
    print_show(movie)
  end

  def how_much?(title_name)
    movie = filter(title: title_name).first
    movie.cost
  end
  end
