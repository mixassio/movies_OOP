require_relative 'netflix.rb'

file_name = ARGV[0] || './movies.txt'
abort 'No such file' unless File.file?(file_name)
movies = Netflix.new(file_name)

=begin
p '*******************'
puts movi.show('10:00')
p '*******************'
puts movi.show('13:00')
p '*******************'
puts movi.show('21:00')
=end

puts movies.when?('Laura')
puts movies.when?('Batman Begins')
begin
  puts movies.when?('The Terminator')
rescue StandardError
    puts $ERROR_INFO.inspect
end
