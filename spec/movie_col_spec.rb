require_relative '../movie_collection.rb'

describe MovieCollection do
  let(:file_name) { './movies.txt' }
  let(:movies) { MovieCollection.new(file_name) }
  it 'all has 250 objects' do
    expect(movies.all.length).to eq(250)
  end

  describe '#stats' do
    subject (:stats) { movies.stats(field) }
    context 'one simple stats' do
      let(:field) { :director }
      it { is_expected.to include('Christopher Nolan' => 7) }
    end
    context 'array stats' do
      let(:field) { :actors }
      it { is_expected.to include('Marlon Brando' => 3) }
    end
    context 'undefined method' do
      let(:field) { :foobar }
      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end
  describe '#filter' do
    subject (:filters) { movies.filter(filtres) }
    context 'one simple filter' do
      let(:filtres) { { genre: 'Crime' } }
      it { expect(filters.length).to eq(53) }
      it { is_expected.to all have_attributes(genre: array_including('Crime')) }
    end
    context 'round filters' do
      let(:filtres) { { year: 1950..1980 } }
      it { expect(filters.length).to eq(77) }
      it { is_expected.to all have_attributes(year: (a_value >= 1950)) }
      it { is_expected.to all have_attributes(year: (a_value <= 1980)) }
    end
    context 'two filters' do
      let(:filtres) { { genre: 'Crime', year: 1950..1980 } }
      it { expect(filters.length).to eq(19) }
      it { is_expected.to all have_attributes(genre: array_including('Crime')) }
    end
    context 'undefined filters' do
      let(:filtres) { { foo: 'bar' } }
      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end
end
