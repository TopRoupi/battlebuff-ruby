require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'valid' do
    it 'with name and limit' do
      expect(build(:room)).to be_valid
    end
  end

  describe 'invalid' do
    it 'without a name' do
      room = build(:room, name: nil)
      expect(room).to be_invalid
    end

    it 'with a name greater than 60' do
      room = build(:room, name: ('0' * 61))
      expect(room).to be_invalid
    end

    it 'without a limit' do
      room = build(:room, limit: nil)
      expect(room).to be_invalid
    end
  end
end
