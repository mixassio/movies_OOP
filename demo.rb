require_relative 'movie.rb'
require_relative 'movie_collection.rb'


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
puts g.stats(:genre)
p '***************************'
puts g.stats(:country)
p '***************************'
puts g.stats(:year)
p '***************************'
p '***filter-re***'
p g.filter(title: /terminator/i)
p '***filter-genre***'
p g.filter(genre: 'Film-Noir')
p '***filter-year***'
p g.filter(year: 1950) 
p '***filter-twice***'
p g.filter(genre: 'Crime', year: 1950) 
p '***filter-range***'
p g.filter(year: 2001..2005)
p '***filter-fullname***'
p g.filter(title: "The Terminator")
p '***Array-of-genresname***'
p g.all.first.owner
p '***errors-then-genres-not-found***'
p g.all.first.has_genre?('Tragedy')