require_relative 'movie_collection.rb'
require_relative 'netflix.rb'
require_relative 'theatre.rb'

file_name = ARGV[0] || './movies.txt'
abort 'No such file' unless File.file?(file_name)
g = MovieCollection.new(file_name)

puts g.map(&:title).first(10)
puts g.select { |movie| movie.year == 1983 }

movies = Netflix.new(file_name)

p movies.cash
movies.pay(10.00)
p movies.cash
movies.pay(10.00)
p movies.cash
# movies.take('Bank')
p movies.cash
movies.show(genre: 'Comedy', period: 'Modern')

movies2 = Theatre.new(file_name)
p movies2.cash
puts movies2.show('13:00')
p movies2.cash
