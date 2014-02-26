require 'spec_helper'
require 'review'
require 'user'

describe Review do
  describe 'attributes' do
    let(:reviewer) { User.new }
    let(:review) do
      Review.new('Great movie', 'Lorem ipsum dolor sit amet consecutum', 4, reviewer)
    end

    it 'has a title' do
      expect(review.title).to eq('Great movie')
    end

    it 'has a text' do
      expect(review.text).to eq('Lorem ipsum dolor sit amet consecutum')
    end

    it 'has a rating' do
      expect(review.rating).to eq(4)
    end

    it 'has a reviewer' do
      expect(review.reviewer).to eq(reviewer)
    end
  end
end
