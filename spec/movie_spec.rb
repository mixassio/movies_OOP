require_relative '../movie.rb'
require_relative '../movie_collection.rb'

file_name = './movies.txt'
@movies = MovieCollection.new(file_name)
movie_data = ["http://imdb.com/title/tt0111161/?ref_=chttp_tt_1", "The Shawshank Redemption", "1994", "USA", "1994-10-14", "Crime,Drama", "142 min", "9.3", "Frank Darabont", "Tim Robbins,Morgan Freeman,Bob Gunton", @movies]

describe Movie do
    before(:all) do
      @movie = Movie.new(*movie_data)
      @movie.genres_collections = ["Crime", "Drama", "Action", "Biography", "History", "Western", "Adventure", "Fantasy", "Romance", "Mystery", "Sci-Fi", "Thriller", "Family", "Comedy", "War", "Animation", "Horror", "Music", "Film-Noir", "Musical", "Sport"]
    end
    it 'has genre' do
      @movie.has_genre?('Drama').should eq true
    end
    it 'to_s' do
      @movie.to_s.should eq 'The Shawshank Redemption (1994-10-14; ["Crime", "Drama"]) - 142 min'
    end
  end