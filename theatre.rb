require_relative 'movie_collection.rb'

class Theatre < MovieCollection
  def show
    p 'Now showing: (название выбранного кина) (время начала) - (время окончания)'
  end
end
