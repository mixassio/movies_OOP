require_relative '../netflix.rb'
require_relative '../movie.rb'
require_relative '../movie_collection.rb'

describe Netflix do
  let(:file_name) { './movies.txt' }
  let(:theatre) { Netflix.new(file_name) }

  describe 'money' do
    context 'add money' do
      it { expect { theatre.pay(10) }.to change(theatre, :account).from(0).to(10) }
    end
    context 'show and spend money' do
      before { theatre.pay(10) }
      it { expect { theatre.show(title: 'The Terminator') }.to change(theatre, :account).from(10).to(7) }
      it { expect { theatre.show(genre: 'Comedy', period: 'Classic', director: 'William Wyler') }.to change(theatre, :account).from(10).to(8.5) }
    end
    context 'No money' do
      it { expect { theatre.show(title: 'The Terminator') }.to raise_error(RuntimeError) }
    end
    context 'how much' do
      it { expect(theatre.how_much?('The Terminator')).to eq(3) }
    end
  end
end
