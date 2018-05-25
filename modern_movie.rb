require_relative 'movie.rb'

class ModernMovie < Movie

    def to_s
        "#{@title} - современное кино: играют #{@actors.join(', ')}"
    end
end
