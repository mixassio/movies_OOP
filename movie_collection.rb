require_relative 'movie.rb'
require 'CSV'


class MovieCollection
    def initialize(path)
        @movies = IO.read(path).split("\n").map{|movie| movie.split("|")}.map{|movie|
            Movie.new(*movie)
        }
    end
    def all
        @movies
    end
    def sort_by(field)
        @movies.sort_by(&field)
    end
    def stats(field)
        @movies.map(&field).flatten.group_by(&:itself).map{|k, v| {k => v.length}}
    end
    def filter(field)
        field.reduce(@movies){|acc, (key, val)| acc.select{|el| 
            el.send(key).kind_of?(Array) ? el.send(key).any? {|le| le === val} : val === el.send(key)}}
    end
end
