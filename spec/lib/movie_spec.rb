require 'spec_helper'
require 'movie'

describe Movie do
  describe 'attributes' do
    let('movie') do
      Movie.new('Die Hard', 'Action', Date.new(1996, 1, 1))
    end

    it 'has a title' do
      expect(movie.title).to eq('Die Hard')
    end

    it 'has a genre' do
      expect(movie.genre).to eq('Action')
    end

    it 'has a date' do
      expect(movie.date).to eq(Date.new(1996, 1, 1))
    end
  end

  describe 'ordering' do
    it 'orders itself by its title' do
      aladdin = Movie.new('Aladdin', 'foo', Date.new)
      top_gun = Movie.new('Top Gun', 'foo', Date.new)

      ordered_movies = [top_gun, aladdin].sort

      expect(ordered_movies.first).to eq(aladdin)
      expect(ordered_movies.last).to eq(top_gun)
    end
  end
end