class MovieRating
  def initialize(ratings)
    @ratings = ratings
  end

  def rating
    return nil if ratings.empty?

    (ratings.reduce(&:+).to_f / ratings.length).round(2)
  end
end
