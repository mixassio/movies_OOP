require_relative '../movie_collection.rb'

file_name = './movies.txt'

describe Movie do
    before(:all) do
      @movies = MovieCollection.new(file_name)
    end
    it 'has genre movie' do
      @movies.all.first.has_genre?('Drama').should eq true
    end
  end