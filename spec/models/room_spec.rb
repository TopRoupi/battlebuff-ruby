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

  describe '#online_players_by_room' do
    before do
      @player1 = create(:player)
      @player2 = create(:player)
      @room = create(:room)
      @room.players << [@player1, @player2]
      @player2.presence_by_room(@room).update(online: true)
    end

    it 'returns all online players in room' do
      expect(@room.online_players).to include(@player2)
    end

    it 'do not return offline players' do
      expect(@room.online_players).to_not include(@player1)
    end
  end
end
