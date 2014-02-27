require 'movie_comparer'

class Cinema
  def initialize(movies = [])
    @movies = movies
  end

  def listing
    @movies.map{ |movie| movie.title }.sort
  end

  def add_movie(movie)
    @movies.push(movie)
  end

  def remove_movie(movie_to_remove)
    @movies.delete(movie_to_remove)
  end

  def listing_by_genre(genre)
    movies_by_genre = @movies.select do |movie|
      movie.genre == genre
    end

    movies_by_genre.map{ |movie| movie.title }.sort
  end

  def listing_by_date
    @movies.sort_by(&:date).map{ |movie| movie.title }
  end

  def listing_between(before, after)
    @movies.select do |movie|
      movie.date.between?(before, after)
    end.map{|movie| movie.title}.sort
  end

  def group_by_genre
    @movies.reduce({}) do |movies_by_genre, movie|
      movies_by_genre[movie.genre] ||= []
      movies_by_genre[movie.genre] << movie.title
      movies_by_genre
    end
  end

  def movies_per_genre
    @movies.reduce({}) do |movies_per_genre, movie|
      movies_per_genre[movie.genre] ||= 0
      movies_per_genre[movie.genre] += 1
      movies_per_genre
    end
  end

  def similar_movies(movie_to_compare)
    comparer = MovieComparer.new(movie_to_compare)

    @movies.select do |movie|
      comparer.similarity_to(movie) > 20
    end.map(&:title)
  end
end