class User
  attr_reader :favourite_movies

  def initialize(favourite_movies = [])
    @favourite_movies = favourite_movies
  end

  def add_favourite(movie)
    @favourite_movies << movie
  end

  def remove_favourite(movie)
    @favourite_movies.delete(movie)
  end
end
