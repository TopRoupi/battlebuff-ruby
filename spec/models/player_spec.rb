require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'from_omniauth' do
    it 'save user profile' do
      Player.from_omniauth OmniAuth.config.mock_auth[:steam]
      expect(Player.count).to eq(1)
    end
  end
end
