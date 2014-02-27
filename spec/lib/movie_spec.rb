require 'spec_helper'
require 'movie'
require 'pry'

describe Movie, :vcr do
  let('movie') do
    Movie.new('0095016')
  end

  describe 'attributes' do
    let(:id) { '0095016' }
    let('movie') do
      Movie.new(id, test_movie_database)
    end
    let('test_movie_database') do
      double('Custom IMDB', title: 'Die Hard',
                            director: ['John McTiernan'],
                            release_date: '1988-7-22'
            )
    end

    it 'has a title' do
      expect(movie.title).to eq('Die Hard')
    end

    it 'has a genre' do
      expect(movie.genre).to eq('Action')
    end

    it 'has a director' do
      expect(movie.director).to eq('John McTiernan')
    end

    it 'has a date' do
      expect(movie.date).to eq(Date.new(1988, 7, 22))
    end
  end

  describe 'ordering' do
    it 'orders itself by its title' do
      aladdin = Movie.new('0103639')
      top_gun = Movie.new('0092099')

      ordered_movies = [top_gun, aladdin].sort

      expect(ordered_movies.first).to eq(aladdin)
      expect(ordered_movies.last).to eq(top_gun)
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

  describe 'rating' do
    let('movie') do
      Movie.new('0095016')
    end

    context "when the movie has some reviews" do
      it 'calculates the movie rating based on reviews' do
        great = Review.new('Great movie', 'Great!!', 5)
        meh = Review.new('Meeehhh', 'Not impressive', 3)
        bad = Review.new('This movie sucks', "Don't watch it!", 0)

        movie.reviews << great
        movie.reviews << meh
        movie.reviews << bad

        expect(movie.rating).to eq(2.67)
      end
    end

    context "when it has no reviews" do
      it 'returns nil' do
        expect(movie.rating).to eq(nil)
      end
    end
  end

  describe 'similarity_to' do
    let(:aladdin) { Movie.new('0103639')}
    let(:top_gun) { Movie.new('0092099') }

    it 'is 100% similar to itself' do
      other_aladdin = Movie.new('0103639')
      expect(aladdin.similarity_to(other_aladdin)).to eq(100.0)
    end

    context 'when it has the same genre as another movie' do
      it 'is 50% similar' do
        up = Movie.new('1049413')

        expect(aladdin.similarity_to(up)).to eq(50.0)
      end
    end

    context 'when it has the same director as another movie' do
      it 'is 25% similar' do
        the_fan = Movie.new('0116277')

        expect(top_gun.similarity_to(the_fan)).to eq(25.0)
      end
    end

    context 'when it has the same genre and director' do
      it 'is 75% similar' do
        man_on_fire = Movie.new('0328107')

        expect(top_gun.similarity_to(man_on_fire)).to eq(75.0)
      end
    end
  end
end