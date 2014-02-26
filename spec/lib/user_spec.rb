require 'spec_helper'
require 'user'

describe User do
  let(:user) { User.new }
  let(:battle_royale) do
    Movie.new('Battle Royale', 'Adventure', 'Kinji Fukusaku', Date.new(2002, 8, 2))
  end

  context 'favourite movies' do
    it 'can add favourite movies' do
      user.add_favourite(battle_royale)

      expect(user.favourite_movies).to include(battle_royale)
    end

    it 'can removes favourite movies' do
      user = User.new([battle_royale])
      user.remove_favourite(battle_royale)

      expect(user.favourite_movies).to_not include(battle_royale)
    end
  end
end
