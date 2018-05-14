require_relative 'movie.rb'
require 'CSV'

class MovieCollection
    attr_reader :genres

    def initialize(path)
        @genres = []
        @movies = IO.read(path).split("\n").map{|movie| movie.split("|")}.map{|movie|
            @genres = [*@genres, *movie[5].split(',')].uniq
            Movie.new(*movie, self)
        }
    end
    def all
        @movies
    end
    def sort_by(field)
        @movies.sort_by(&field)
    end
    def stats(field)
        @movies.flat_map(&field).group_by(&:itself).map{|k, v| {k => v.length}}
    end
    def filter(field)
        field.reduce(@movies){|acc, (key, val)| acc.select{|el| 
            el.send(key).kind_of?(Array) ? el.send(key).any? {|le| le === val} : val === el.send(key)}}
    end
end
