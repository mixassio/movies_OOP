require_relative '../netflix.rb'
require_relative '../movie.rb'
require_relative '../movie_collection.rb'

describe Netflix do
  let(:file_name) { './movies.txt' }
  let(:theatre1) { Netflix.new(file_name) }
  let(:theatre2) { Netflix.new(file_name) }

  describe 'money' do
    context 'add money' do
      it { expect { theatre1.pay(13) }.to change(theatre1, :account_user).from(0).to(13) }
      it { expect { theatre2.pay(12) }.to change(theatre2, :account_user).from(0).to(12) }
    end
    context 'same csh desk' do
      it { expect(Netflix.cash).to be == '$25.00' }
    end
    context 'show and spend money' do
      before { theatre1.pay(10) }
      it { expect { theatre1.show(title: 'The Terminator') }.to change(theatre1, :account_user).from(10).to(7) }
      it { expect { theatre1.show(genre: 'Comedy', period: 'Classic', director: 'William Wyler') }.to change(theatre1, :account_user).from(10).to(8.5) }
    end
    context 'No money' do
      it { expect { theatre1.show(title: 'The Terminator') }.to raise_error(RuntimeError) }
    end
    context 'how much' do
      it { expect(theatre1.how_much?('The Terminator')).to eq(3) }
    end
    context 'incase' do
      it { expect { Netflix.take('murder') }.to raise_error(RuntimeError) }
      before { Netflix.take('Bank') }
      it { expect(Netflix.cash).to be == '$0.00' }
    end
  end
end
