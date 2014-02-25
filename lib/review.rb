class Review
  attr_reader :title, :rating, :text
  def initialize(title, text, rating)
    @title = title
    @text = text
    @rating = rating
  end
end
