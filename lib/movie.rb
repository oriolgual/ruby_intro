require 'date'
require 'review'

class Movie
  attr_reader :title, :genre, :director, :date, :reviews

  def initialize(title, genre, director, date)
    @title     = title
    @genre     = genre
    @director  = director
    @date      = date
    @reviews   = []
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

  def <=>(other_movie)
    title <=> other_movie.title
  end

  def ==(other)
    title == other.title && genre == other.genre && director == other.director
  end
end