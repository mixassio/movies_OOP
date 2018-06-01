require_relative '../netflix.rb'
require_relative '../movie.rb'

describe Netflix do
  subject (:theatre) { Netflix.new('./movies.txt') }

  context '1900-1945' do
    let(:year) { 1910 }
    it { is_expected.to be_an AncientMovie }
  end
  context '1945-1968' do
    let(:year) { 1950 }
    it { is_expected.to be_an ClassicMovie }
  end
  context '1968-2000' do
    let(:year) { 1980 }
    it { is_expected.to be_an ModernMovie }
  end
  context '2000-2020' do
    let(:year) { 2010 }
    it { is_expected.to be_an NewMovie }
  end
end
