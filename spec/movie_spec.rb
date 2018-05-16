require_relative '../movie.rb'
require_relative '../movie_collection.rb'

movie_data = ["http://imdb.com/title/tt0111161/?ref_=chttp_tt_1", "The Shawshank Redemption", "1994", "USA", "1994-10-14", "Crime,Drama", "142 min", "9.3", "Frank Darabont", "Tim Robbins,Morgan Freeman,Bob Gunton"]

describe Movie do
    let(:collection) { double(genres: %[Crime Drama Action Biography History Western Adventure Fantasy Romance Mystery Sci-Fi Thriller Family Comedy War Animation Horror Music Film-Noir Musical Sport] )}
    let(:movie) { Movie.new(*movie_data, collection) }

    it 'has genre' do
        expect(movie.has_genre?('Drama')).to be true
    end

    it 'to_s' do
        expect(movie.to_s).to eq('The Shawshank Redemption (1994-10-14; ["Crime", "Drama"]) - 142 min')
    end
    it 'genre and actors are Array' do
        expect(movie.genre).to be_kind_of(Array)
        expect(movie.actors).to be_kind_of(Array)
    end
  end