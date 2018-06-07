require_relative 'movie_collection.rb'
require_relative 'netflix.rb'

file_name = ARGV[0] || './movies.txt'
abort 'No such file' unless File.file?(file_name)
g = MovieCollection.new(file_name)

puts g.map{|movie| movie.title}.first(10)
puts g.select{|movie| movie.year == 1983}


movies = Netflix.new(file_name)

p movies.cash
p movies.pay(10)
p movies.cash
p movies.pay(10)
p movies.cash
p movies.take('Bank')
p movies.cash
