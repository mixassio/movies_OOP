require_relative '../theatre.rb'
require_relative '../movie.rb'
require_relative '../movie_collection.rb'

describe MoviesTheatre::Theatre do
  let(:file_name) { './movies.txt' }
  let(:theatre1) { MoviesTheatre::Theatre.new(file_name) }
  let(:theatre2) { MoviesTheatre::Theatre.new(file_name) }

  describe 'show' do
    context 'stdout' do
      it { expect { theatre1.show('21:00') }.to output.to_stdout }
    end
  end
  describe 'when?' do
    context 'stdout' do
      it { expect { theatre1.when?('Batman Begins') }.to output.to_stdout }
    end
  end
  describe 'money' do
    context 'cash desk' do
      it { expect {
        theatre1.show('21:00')
        theatre1.show('10:00')
      }.to change(theatre1, :cash).to("$13.00") }
      it { expect {
        theatre2.show('16:00')
      }.to change(theatre2, :cash).to("$5.00") }
    end
    context 'incase' do
      before { theatre1.show('21:00') }
      before { theatre1.show('10:00') }
      before { theatre2.show('16:00') }
      it { expect { theatre1.take('murder') }.to raise_error(RuntimeError) }
      before { theatre2.take('Bank') }
      it { expect(theatre2.cash).to be == '$0.00' }
      it { expect(theatre1.cash).to be == '$13.00' }
    end
  end
end

