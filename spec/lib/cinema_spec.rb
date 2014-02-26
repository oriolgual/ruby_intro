require 'spec_helper'
require 'cinema'

describe Cinema do
  describe 'add' do
    it 'adds a movie to our listing' do
      cinema = Cinema.new

      cinema.add(Movie.new('Top Gun', 'Action', 'Tony Scott', Date.new(1986, 5, 16)))

      expect(cinema.listing).to include('Top Gun')
    end
  end

  describe 'listing' do
    let(:cinema) do
      die_hard = Movie.new('Die Hard', 'Action', 'John McTiernan', Date.new(1988, 7, 22))
      aladdin = Movie.new('Aladdin', 'Animation', 'Ron Clements', Date.new(1992, 11, 25))
      clerks = Movie.new('Clerks', 'Comedy', 'Kevin Smith', Date.new(1994, 11, 30))

      Cinema.new([die_hard, aladdin, clerks])
    end

    it 'returns an array with the title of our movies' do
      titles = cinema.listing

      expect(titles).to include('Die Hard')
      expect(titles).to include('Aladdin')
      expect(titles).to include('Clerks')
    end

    it 'returns the movies ordered by title' do
      titles = cinema.listing

      expect(titles[0]).to eq('Aladdin')
      expect(titles[1]).to eq('Clerks')
      expect(titles[2]).to eq('Die Hard')
    end
  end

  describe 'group_by_genre' do
    it 'group the movies of the cinema by genre' do
      die_hard = Movie.new('Die Hard', 'Action', 'John McTiernan', Date.new(1988, 7, 22))
      aladdin = Movie.new('Aladdin', 'Animation', 'Ron Clements', Date.new(1992, 11, 25))
      clerks = Movie.new('Clerks', 'Comedy', 'Kevin Smith', Date.new(1994, 11, 30))
      cinema = Cinema.new([die_hard, aladdin, clerks])

      titles = cinema.group_by_genre
      expect(titles['Action']).to include('Die Hard')
      expect(titles['Action'].length).to eq(1)

      expect(titles['Animation']).to eq(['Aladdin'])

      expect(titles.length).to eq(3)
    end
  end

  describe 'movies_per_genre' do
    it 'counts the number of movies in each genre' do
      die_hard = Movie.new('Die Hard', 'Action', 'John McTiernan', Date.new(1988, 7, 22))
      aladdin = Movie.new('Aladdin', 'Animation', 'Ron Clements', Date.new(1992, 11, 25))
      aladdin2 = Movie.new('Aladdin 2', 'Animation', 'Toby Shelton', Date.new(1994, 5, 20))
      clerks = Movie.new('Clerks', 'Comedy', 'Kevin Smith', Date.new(1994, 11, 30))
      cinema = Cinema.new([die_hard, aladdin, aladdin2, clerks])

      histogram = cinema.movies_per_genre

      expect(histogram['Action']).to eq(1)
      expect(histogram['Animation']).to eq(2)
      expect(histogram['Comedy']).to eq(1)
    end
  end
end