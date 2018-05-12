require '/Users/mixassio/Documents/ruby/movies_OOP/Movie.rb'
require '/Users/mixassio/Documents/ruby/movies_OOP/MovieCollection.rb'


file_name = ARGV[0] || './movies.txt'
if !File.file?(file_name)
    abort "No such file"
end
g = MovieCollection.new(file_name)
p g.all.first.has_genre?('Drama')
p g.all.first.actors
p '***************************'
p 'stats'
p '***************************'
puts g.stats(:actors)
p '***************************'
puts g.stats(:month)
p '***************************'
puts g.stats(:zhanre)
p '***************************'
puts g.stats(:country)
p '***************************'
puts g.stats(:year)
p '***************************'


p g.filter(zhanre: 'Comedy') 
p g.filter(year: '1950') 
