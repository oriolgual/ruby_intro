require 'date'

class Movie
  attr_reader :title,:genre, :date

  def initialize(title, genre, date)
    @title = title
    @genre = genre
    @date  = date
  end


  def <=>(other_movie)
    title <=> other_movie.title
  end
end