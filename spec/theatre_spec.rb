require_relative '../theatre.rb'
require_relative '../movie.rb'
require_relative '../movie_collection.rb'

describe Theatre do
  let(:file_name) { './movies.txt' }
  let(:theatre) { Theatre.new(file_name) }
  describe 'show' do
    context 'stdout' do
      it { expect { theatre.show('21:00') }.to output.to_stdout }
    end
  end
  describe 'when?' do
    context 'stdout' do
      it { expect { theatre.when?('Batman Begins') }.to output.to_stdout }
    end
  end
end
