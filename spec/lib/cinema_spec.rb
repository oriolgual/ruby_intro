require 'spec_helper'
require 'cinema'

describe Cinema do
  describe 'add' do
    it 'adds a movie to our listing' do
      cinema = Cinema.new

      cinema.add(Movie.new('Top gun', 'Action', Date.new))

      expect(cinema.listing).to include('Top gun')
    end
  end

  describe 'listing' do
    let(:cinema) do
      die_hard = Movie.new('Die hard', 'Action', Date.new(1993, 2, 1))
      aladin = Movie.new('Aladin', 'Animation', Date.new(1996,7, 4))
      clerks = Movie.new('Clerks', 'Comedy', Date.new(2000, 4, 11))

      Cinema.new([die_hard, aladin, clerks])
    end

    it 'returns an array with the title of our movies' do
      titles = cinema.listing

      expect(titles).to include('Die hard')
      expect(titles).to include('Aladin')
      expect(titles).to include('Clerks')
    end

    it 'returns the movies ordered by title' do

    end
  end

  describe 'group_by_genre' do
    it 'group the movies of the cinema by genre' do
      die_hard = Movie.new('Die hard', 'Action', Date.new(1993, 2, 1))
      aladin = Movie.new('Aladin', 'Animation', Date.new(1996,7, 4))
      clerks = Movie.new('Clerks', 'Comedy', Date.new(2000, 4, 11))
      cinema = Cinema.new([die_hard, aladin, clerks])

      titles = cinema.group_by_genre
      expect(titles['Action']).to include('Die hard')
      expect(titles['Action'].length).to eq(1)

      expect(titles['Animation']).to eq(['Aladin'])

      expect(titles.length).to eq(3)
    end
  end

  describe 'movies_per_genre' do
    it 'counts the number of movies in each genre' do
      die_hard = Movie.new('Die hard', 'Action', Date.new(1993, 2, 1))
      aladin = Movie.new('Aladin', 'Animation', Date.new(1996,7, 4))
      aladin2 = Movie.new('Aladin 2', 'Animation', Date.new(1996,7, 4))
      clerks = Movie.new('Clerks', 'Comedy', Date.new(2000, 4, 11))
      cinema = Cinema.new([die_hard, aladin, aladin2, clerks])

      histogram = cinema.movies_per_genre

      expect(histogram['Action']).to eq(1)
      expect(histogram['Animation']).to eq(2)
      expect(histogram['Comedy']).to eq(1)
    end
  end
end