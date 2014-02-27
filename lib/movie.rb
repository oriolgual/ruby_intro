require 'date'
require 'review'

class Movie
  attr_reader :id, :title, :reviews

  def initialize(id, movie_database = nil)
    @id     = id
    @reviews   = []
    @movie_database = movie_database
  end

  def title
    @movie_database.title
  end

  def genre
    @movie_database.genres.first
  end

  def director
    @movie_database.director.first
  end

  def date
    Date.parse(@movie_database.release_date.to_s)
  end

  def rating
    return nil if reviews.empty?

    (reviews.map(&:rating).reduce(&:+).to_f / reviews.length).round(2)
  end

  def similarity_to(other_movie)
    return 100.0 if self == other_movie

    similarity = 0
    similarity += 50 if genre == other_movie.genre
    similarity += 25 if director == other_movie.director

    similarity.to_f
  end

  def ==(other)
    title == other.title && genre == other.genre && director == other.director
  end
end