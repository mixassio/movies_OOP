require_relative '../netflix.rb'
require_relative '../movie.rb'
require_relative '../movie_collection.rb'

describe Netflix do
    let(:file_name) { './movies.txt' }
    let(:movies) { MovieCollection.new(file_name) }
    let (:theatre) { Netflix.new(file_name) }

=begin
  describe 'show' do
  subject { theatre.show(field) }
  context 'range years' do
    let(:field) { 1910 }
    let(:list_true) { movies(period: 'Classic') }
    it { is_expected.to eq  3}
  end
  context '1945-1968' do
    let(:year) { 1950 }
    it { is_expected.to be_an ClassicMovie }
  end
  end
=end
  describe 'pay' do
    let(:money) { theatre.pay(5) }
    it { expect(money).to eq(5) }
    let(:money2) { theatre.account }
    it { expect(money2).to eq(5) } # Не пойму никак как проверить изменяемость account
  end

end
