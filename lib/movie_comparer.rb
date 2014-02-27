class MovieComparer
  attr_reader :movie

  def initialize(movie)
    @movie = movie
  end

  def similarity_to(other_movie)
    return 100.0 if movie.title == other_movie.title

    similarity = 0
    similarity += 50 if movie.genre == other_movie.genre
    similarity += 25 if movie.director == other_movie.director

    similarity.to_f
  end
end
