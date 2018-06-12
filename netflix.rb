require 'time'
require_relative 'movie_collection.rb'
require_relative 'cashbox.rb'
require 'Money'

module MoviesTheatre
  class Netflix < MovieCollection
    extend Cashbox
    attr_reader :account_user
    def initialize(path)
      super
      @account_user = 0
    end

    def pay(money)
      self.class.pay_to_cash(money)
      @account_user += money
    end

    def show(filters)
      movies = filter(filters)
      movie = get_random_movie(movies)
      raise('No money, put your account') if @account_user - movie.cost < 0
      @account_user -= movie.cost
      print_show(movie)
    end

    def how_much?(title_name)
      movie = filter(title: title_name).first
      movie.cost
    end
  end
end
