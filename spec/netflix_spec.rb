require_relative '../netflix.rb'
require_relative '../movie.rb'
require_relative '../movie_collection.rb'

describe Netflix do
  let(:file_name) { './movies.txt' }
  let(:movies) { MovieCollection.new(file_name) }
  let (:theatre) { Netflix.new(file_name) }

  describe 'show' do
    context 'range years' do
      let(:year) { 1910 }
      it { is_expected.to be_an AncientMovie }
    end
    context '1945-1968' do
      let(:year) { 1950 }
      it { is_expected.to be_an ClassicMovie }
    end
  end
end
