require_relative 'movie_collection.rb'
require_relative 'netflix.rb'
require_relative 'theatre.rb'

file_name = ARGV[0] || './movies.txt'
abort 'No such file' unless File.file?(file_name)
g = MovieCollection.new(file_name)

puts g.map(&:title).first(10)
puts g.select { |movie| movie.year == 1983 }

movies1 = Netflix.new(file_name)
movies2 = Netflix.new(file_name)

movies1.pay(13)
movies2.pay(12)
puts Netflix.cash
