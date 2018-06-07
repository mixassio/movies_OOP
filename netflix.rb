require 'time'
require_relative 'movie_collection.rb'
require_relative 'cashbox.rb'

class Netflix < MovieCollection
  include Cashbox
  
  def pay(money)
    pay_to_cash(money)
  end

  def cash
    get_cash
  end

  def take(who)
    raise('Alarm, police was caled!') if who != 'Bank'
    incase
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
