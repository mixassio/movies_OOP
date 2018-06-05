require_relative 'netflix.rb'
require_relative 'theatre.rb'

file_name = ARGV[0] || './movies.txt'
abort 'No such file' unless File.file?(file_name)
movies = Theatre.new(file_name)

p '*******************'
puts movies.show('10:00')
p '*******************'
puts movies.show('13:00')
p '*******************'
puts movies.show('21:00')

puts movies.when?('Laura')
puts movies.when?('Batman Begins')
begin
  puts movies.when?('The Terminator')
rescue StandardError
  puts $ERROR_INFO.inspect
end
movies2 = Netflix.new(file_name)
puts movies2.how_much?('The Terminator')
puts movies2.account
movies2.pay(25)
puts movies2.account
movies2.pay(25)
puts movies2.account
p '*********************************************************'
puts movies2.show(genre: 'Comedy', period: 'Modern')
puts movies2.account

#puts movies.all