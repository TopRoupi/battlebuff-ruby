require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'valid' do
    it 'with content and player' do
      expect(build(:message)).to be_valid
    end
  end
  describe 'invalid' do
    it 'without a content' do
      message = build(:message, content: nil)
      expect(message).to be_invalid
    end

    it 'with a empty content' do
      message = build(:message, content: '  ')
      expect(message).to be_invalid
    end

    it 'without a player' do
      message = build(:message, player: nil)
      expect(message).to be_invalid
    end

    it 'with a content greater than 300' do
      message = build(:message, content: ('0' * 301))
      expect(message).to be_invalid
    end
  end
end
