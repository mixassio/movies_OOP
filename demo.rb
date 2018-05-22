require_relative 'movie.rb'
require_relative 'movie_collection.rb'

file_name = ARGV[0] || './movies.txt'
abort 'No such file' unless File.file?(file_name)
g = MovieCollection.new(file_name)

p g.all.first.has_genre?('Drama')
p g.all.first.actors
p '***************************'
p '***stats***'
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
puts g.filter(title: /terminator/i)
p '***filter-genre***'
puts g.filter(genre: 'Film-Noir')
p '***filter-year***'
puts g.filter(year: 1950)
p '***filter-twice***'
puts g.filter(genre: 'Crime', year: 1950)
p '***filter-range***'
puts g.filter(year: 2001..2005)
p '***filter-fullname***'
puts g.filter(title: 'The Terminator')
p '***Array-of-genresname***'
p g.all.last.owner.genres
p '***************************'
p '***errors-then-genres-not-found***'
begin
  g.all.first.has_genre?('Tragedy')
rescue StandardError
  puts $ERROR_INFO.inspect
end
begin
    g.filter(tle: 'The Terminator')
  rescue ArgumentError
    puts $ERROR_INFO.inspect
  end

# test branch