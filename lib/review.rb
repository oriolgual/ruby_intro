class Review
  attr_reader :title, :rating, :text, :reviewer

  def initialize(title, text, rating, reviewer = nil)
    @title = title
    @text = text
    @rating = rating
    @reviewer = reviewer
  end
end
