require 'spec_helper'
require 'cinema'
require 'movie'

describe Cinema do
  describe 'add' do
    it 'adds a movie to our listing' do
      cinema = Cinema.new
      pako = double('Pako', {title: 'Top Gun', director: 'Director'})
      cinema.add_movie(pako)

      expect(cinema.listing).to include('Top Gun')
    end
  end

  describe 'remove' do
    it 'remove a movie from our listing' do
      top_gun = double(title: 'Top Gun', genre: 'Action', director: 'Tony Scott', date: Date.new(1986, 5, 16))
      cinema = Cinema.new([top_gun])

      cinema.remove_movie(top_gun)

      expect(cinema.listing).to_not include('Top Gun')
    end
  end

  describe 'listing' do
    let(:cinema) do
      die_hard = double(title: 'Die Hard', genre: 'Action', director: 'John McTiernan', date: Date.new(1988, 7, 22))
      aladdin = double(title: 'Aladdin', genre: 'Animation', director: 'Ron Clements', date: Date.new(1992, 11, 25))
      clerks = double(title: 'Clerks', genre: 'Comedy', director: 'Kevin Smith', date: Date.new(1994, 11, 30))

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
      die_hard = double(title: 'Die Hard', genre: 'Action', director: 'John McTiernan', date: Date.new(1988, 7, 22))
      aladdin = double(title: 'Aladdin', genre: 'Animation', director: 'Ron Clements', date: Date.new(1992, 11, 25))
      clerks = double(title: 'Clerks', genre: 'Comedy', director: 'Kevin Smith', date: Date.new(1994, 11, 30))

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
      die_hard = double(title: 'Die Hard', genre: 'Action', director: 'John McTiernan', date: Date.new(1988, 7, 22))
      aladdin = double(title: 'Aladdin', genre: 'Animation', director: 'Ron Clements', date: Date.new(1992, 11, 25))
      aladdin2 = double(title: 'Aladdin 2', genre: 'Animation', director: 'Toby Shelton', date: Date.new(1994, 5, 20))
      clerks = double(title: 'Clerks', genre: 'Comedy', director: 'Kevin Smith', date: Date.new(1994, 11, 30))
      cinema = Cinema.new([die_hard, aladdin, aladdin2, clerks])

      histogram = cinema.movies_per_genre

      expect(histogram['Action']).to eq(1)
      expect(histogram['Animation']).to eq(2)
      expect(histogram['Comedy']).to eq(1)
    end
  end

  describe 'similar_movies' do
    it 'returns the titles of similar movies' do
      die_hard = double(title: 'Die Hard', genre: 'Action', director: 'John McTiernan', date: Date.new(1988, 7, 22))
      aladdin = double(title: 'Aladdin', genre: 'Animation', director: 'Ron Clements', date: Date.new(1992, 11, 25))
      aladdin2 = double(title: 'Aladdin 2', genre: 'Animation', director: 'Toby Shelton', date: Date.new(1994, 5, 20))
      clerks = double(title: 'Clerks', genre: 'Comedy', director: 'Kevin Smith', date: Date.new(1994, 11, 30))

      up = double(title: 'Up', genre: 'Animation', director: 'Pete Docter', date: Date.new(2009, 5, 29))

      cinema = Cinema.new([die_hard, aladdin, aladdin2, clerks])

      similar_movies = cinema.similar_movies(up)

      expect(similar_movies).to include('Aladdin')
      expect(similar_movies).to include('Aladdin 2')
      expect(similar_movies.length).to eq(2)
    end
  end
end