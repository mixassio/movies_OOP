require_relative 'movie.rb'

class ModernMovie < Movie

    def to_s
        "#{@title} - современное кино: играют #{@actors.join(', ')}_____#{@genre}"
    end
    def cost 
        3
    end
end
