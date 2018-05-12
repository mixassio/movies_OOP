require '/Users/mixassio/Documents/ruby/movies_OOP/Movie.rb'
require 'CSV'


class MovieCollection
    def initialize(path_to_file)
        @movies = IO.read(path_to_file).split("\n").map{|movie| movie.split("|")}.map{|movie|
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
        key = field.keys[0]
        value = field.values[0]
        p field
        field.reduce(@movies){|acc, re|
            p acc
            new_acc = acc.select{|el| el.send(re[0]).include? re[1]}
        }
        #@movies.select{|el| el.send(key).include? value}
    end
end

#        @movies.select{|el| el.send(:key, value)}
# 