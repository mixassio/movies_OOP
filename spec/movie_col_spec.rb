require_relative '../movie_collection.rb'

file_name = './movies.txt'

describe Movie do
    let(:movies) { MovieCollection.new(file_name) }

    it 'all has 250 objects' do
      expect(movies.all.length).to eq(250)
    end
    it 'stats' do
        expect(movies.stats(:director)["Christopher Nolan"]).to eq(7)
    end
    it 'filter' do
        expect(movies.filter(genre: 'Crime', year: 1950..1985).length).to eq(21)
    end
  end


  