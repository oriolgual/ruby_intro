require 'date'
require 'review'
require 'imdb'

class Movie
  attr_reader :id, :title, :reviews

  def initialize(id)
    @id     = id
    @reviews   = []
  end

  def title
    imdb.title
  end

  def genre
    imdb.genres.first
  end

  def director
    imdb.director.first
  end

  def date
    Date.parse(imdb.release_date.to_s)
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

  private
  def imdb
    @imdb ||= Imdb::Movie.new(id)
  end
end