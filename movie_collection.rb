require_relative 'movie.rb'
require 'CSV'
module MoviesTheatre

class MovieCollection
  include Enumerable
  attr_reader :filter, :genres
  def initialize(path)
    @movies = IO.read(path).split("\n").map { |movie| movie.split('|') }.map do |movie|
      MoviesTheatre::Movie.choose_class_movie(movie[2].to_i).new(*movie, self)
    end
    @genres = @movies.flat_map(&:genre).uniq
    @fields = %(title year country genre rating director actors month).split
  end

  def each(&block)
    @movies.each(&block)
  end

  def all
    @movies
  end

  def sort_by(field)
    @movies.sort_by(&field)
  end

  def stats(field)
    raise(ArgumentError, "stats #{field} not found") unless @fields.include?(field.to_s)
    @movies.flat_map(&field).group_by(&:itself).map { |k, v| [k, v.length] }.to_h
  end

  def filter(field)
    # p field
    field.reduce(@movies) do |acc, (key, val)|
      raise(ArgumentError, "filter #{key} not found") unless MoviesTheatre::Movie.instance_methods(false).include?(key)
      acc.select { |el| el.matches?(key, val) }
    end
  end

  def get_random_movie(movies)
    movies.max_by { |movie| movie.rating.to_f * rand(10) }
  end

  def print_show(movie)
    current_time = Time.new
    puts "Now showing: #{movie.title} #{current_time.strftime('%H:%M')} - #{(current_time + movie.time * 60).strftime('%H:%M')}"
  end
end
end