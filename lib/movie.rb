require 'date'
require 'review'

class Movie
  attr_reader :title, :genre, :date, :reviews

  def initialize(title, genre, date)
    @title = title
    @genre = genre
    @date  = date
    @reviews = []
  end


  def <=>(other_movie)
    title <=> other_movie.title
  end

  def rating
    return nil if reviews.empty?

    (reviews.map(&:rating).reduce(&:+).to_f / reviews.length).round(2)
  end
end