require_relative 'movie.rb'
require_relative 'movie_collection.rb'
require_relative 'ancient_movie.rb'
require_relative 'classic_movie.rb'
require_relative 'modern_movie.rb'
require_relative 'new_movie.rb'
require_relative 'netflix.rb'

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
puts g.filter(genre: %w[Adventure Comedy])
creater = Movie.choose_class_movie(1970)

data = ['http://imdb.com/title/tt0111161/?ref_=chttp_tt_1', 'The Shawshank Redemption', '1994', 'USA', '1994-10-14', 'Crime,Drama', '142 min', '9.3', 'Frank Darabont', 'Tim Robbins,Morgan Freeman,Bob Gunton']

movie = creater.new(*data, g)

puts movie
p '***************************'
p '***************************'
p '***************************'

movi = Netflix.new(file_name)

puts movi.show('10:00')
puts movi.show('13:00')
puts movi.show('21:00')
begin
  puts movi.show('03:00')
rescue StandardError
  puts $ERROR_INFO.inspect
end
puts g.filter(title: 'Batman Begins')
begin
  puts movi.when?('Batman Begins')
rescue StandardError
  puts $ERROR_INFO.inspect
end
puts movi.when?('Laura')
begin
    puts movi.when?('The Terminator')
  rescue StandardError
    puts $ERROR_INFO.inspect
  end
