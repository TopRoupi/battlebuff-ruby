require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'from_omniauth' do
    it 'save user profile' do
      Player.from_omniauth OmniAuth.config.mock_auth[:steam]
      expect(Player.count).to eq(1)
    end
  end

  describe '#presence_by_room' do
    context 'have a existed presence' do
      it 'returns the presence of the room id' do
        player = create(:player)
        room = create(:room)
        room.players << player
        expect(player.presence_by_room(room)).to eq(room.presences[0])
      end
    end

    context 'do not have a existed presence' do
      it 'create and returns the presence of the room id' do
        player = create(:player)
        room = create(:room)
        presence = player.presence_by_room(room.id)
        expect(presence.room_id).to eq(room.id)
        expect(presence.player_id).to eq(player.id)
      end
    end
  end

  describe '#set_online_status_by_room' do
    it 'alter the online status of the player by a room id' do
      player = create(:player)
      room = create(:room)
      player.set_online_status_by_room(true, room.id)
      expect(player.presence_by_room(room).online).to equal(true)
    end
  end
end
