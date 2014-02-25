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

  describe 'rating' do
    let('movie') do
      Movie.new('Die Hard', 'Action', Date.new(1996, 1, 1))
    end

    it 'calculates the movie rating based on reviews' do
      great = Review.new('Great movie', 'Great!!', 5)
      meh = Review.new('Meeehhh', 'Not impressive', 3)
      bad = Review.new('This movie sucks', "Don't watch it!", 0)

      movie.reviews << great
      movie.reviews << meh
      movie.reviews << bad

      expect(movie.rating).to eq(3)
    end

    context "when it has no reviews" do
      it 'returns nil' do
        expect(movie.rating).to eq(nil)
      end
    end
  end

  describe 'reviews' do
    it 'returns an array of reviews' do
      great = Review.new('Great movie', 'Great!!', 5)
      meh = Review.new('Meeehhh', 'Not impressive', 3)
      bad = Review.new('This movie sucks', "Don't watch it!", 0)

      movie.reviews << great
      movie.reviews << meh
      movie.reviews << bad

      expect(movie.reviews.length).to eq(3)
      expect(movie.reviews[0]).to eq(great)
      expect(movie.reviews[1]).to eq(meh)
      expect(movie.reviews[2]).to eq(bad)
    end
  end
end