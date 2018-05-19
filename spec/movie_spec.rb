require_relative '../movie.rb'
require_relative '../movie_collection.rb'

movie_data = ['http://imdb.com/title/tt0111161/?ref_=chttp_tt_1', 'The Shawshank Redemption', '1994', 'USA', '1994-10-14', 'Crime,Drama', '142 min', '9.3', 'Frank Darabont', 'Tim Robbins,Morgan Freeman,Bob Gunton']

describe Movie do
  let(:collection) { double(genres: %(Crime Drama Action Biography History Western Adventure Fantasy Romance Mystery Sci-Fi Thriller Family Comedy War Animation Horror Music Film-Noir Musical Sport)) }
  subject(:movie) { Movie.new(*movie_data, collection) }

  context 'parsing' do
    it { is_expected.to have_attributes(link: 'http://imdb.com/title/tt0111161/?ref_=chttp_tt_1', title: 'The Shawshank Redemption', year: 1994, country: 'USA', date: '1994-10-14', genre: %w[Crime Drama], time: '142 min', rating: '9.3', director: 'Frank Darabont', actors: ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton']) }
  end
  it 'genres and month after parsing' do
    expect(movie.genres_collections).to eq('Crime Drama Action Biography History Western Adventure Fantasy Romance Mystery Sci-Fi Thriller Family Comedy War Animation Horror Music Film-Noir Musical Sport')
    expect(movie.month).to eq('October')
  end

  it 'has genre' do
    expect(movie.has_genre?('Drama')).to be true
  end

  it 'to_s' do
    expect(movie.to_s).to eq('The Shawshank Redemption (1994-10-14; ["Crime", "Drama"]) - 142 min')
  end
end
