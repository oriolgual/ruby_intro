require 'spec_helper'
require 'review'

describe Review do
  describe 'attributes' do
    let(:revire) do
      Review.new('Great movie', 'Lorem ipsum dolor sir amet consecutum', 4)
    end

    it 'has a title' do
      expect(review.title).to eq('Great movie')
    end

    it 'has a text' do
      expect(review.title).to eq('Lorem ipsum dolor sit amet consecutum')
    end

    it 'has a rating' do
      expect(review.rating).to eq(4)
    end
  end
end
