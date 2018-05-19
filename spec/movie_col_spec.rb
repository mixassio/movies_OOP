require_relative '../movie_collection.rb'

describe MovieCollection do
  let(:file_name) { './movies.txt' }
  let(:movies) { MovieCollection.new(file_name) }
  it 'all has 250 objects' do
    expect(movies.all.length).to eq(250)
  end

  describe '#stats' do
    subject (:movies2) { MovieCollection.new(file_name).stats(field) }
    context 'one simple stats' do
      let(:field) { :director }
      it { is_expected.to include('Christopher Nolan' => 7) }
    end
    context 'array stats' do
      let(:field) { :actors }
      it { is_expected.to include('Marlon Brando' => 3) }
    end
    context 'undefined method' do
      let(:field) {:foobar}
      it { expect { subject }.to raise_error(NoMethodError)}
    end
  end
  describe '#filter' do
    subject (:movies3) { MovieCollection.new(file_name).filter(filtres) }
    context 'one simple filter' do
      let(:filtres) { { genre: 'Crime' } }
      it { expect(movies3.length).to eq(53) }
    end
    context 'round filters' do
      let(:filtres) { { year: 1950..1980 } }
      it { expect(movies3.length).to eq(77) }
    end
    context 'two filters' do
      let(:filtres) { { genre: 'Crime', year: 1950..1980 } }
      it { expect(movies3.length).to eq(19) }
    end
    context 'undefined filters' do
      let(:filtres) { {foo: 'bar'} }
      it { expect { subject }.to raise_error(NoMethodError)}
    end
  end
end
