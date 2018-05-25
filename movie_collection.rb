require_relative 'movie.rb'
require 'CSV'
require_relative 'ancient_movie.rb'
require_relative 'classic_movie.rb'
require_relative 'modern_movie.rb'
require_relative 'new_movie.rb'


class MovieCollection
  YEARS = (
        (1900..1945).map{|el| [el, AncientMovie]} + 
        (1945..1968).map{|el| [el, ClassicMovie]} + 
        (1968..2000).map{|el| [el, ModernMovie]} + 
        (2000..2020).map{|el| [el, NewMovie]}
       ).to_h
  
  attr_reader :genres, :filter, :create_movie

  def create_movie(year)
    type = YEARS[year]
    ->(*data) { type.new(*data) }
  end

  def initialize(path)
    @movies = IO.read(path).split("\n").map { |movie| movie.split('|') }.map do |movie|
      creator = create_movie(movie[2].to_i)
      creator.call(*movie, self)
    end
    @genres = @movies.flat_map(&:genre).uniq
    @fields = %(title year country genre rating director actors month).split
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
    field.reduce(@movies) do |acc, (key, val)|
      raise(ArgumentError, "filter #{key} not found") unless Movie.instance_methods(false).include?(key)
      acc.select { |el| el.matches?(key, val) }
    end
  end
end
