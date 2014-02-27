class MovieComparer
  def initialize(movies)
    @movies = movies
  end

  def similarities_to(movie_to_compare)
    @movies.map do |movie|
      [movie_to_compare.similarity_to(movie), movie]
    end
  end
end
