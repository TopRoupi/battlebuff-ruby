require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @player = Player.from_omniauth OmniAuth.config.mock_auth[:steam]
    @message = Message.create
  end

  it 'is valid with content and player' do
    @message.content = 'a message'
    @message.player = @player
    expect(@message).to be_valid
  end

  it 'is invalid without a content' do
    @message.content = nil
    @message.valid?
    expect(@message.errors.details[:content]).to include(error: :blank)
  end

  it 'is invalid with a empty content' do
    @message.content = '  '
    @message.valid?
    expect(@message.errors.details[:content]).to include(error: :blank)
  end

  it 'is invalid without a player' do
    @message.content = 'a message'
    @message.player = nil
    @message.valid?
    expect(@message.errors.details[:player]).to include(error: :blank)
  end

  it 'is invalid with a content greater than 300' do
    @message.content = '0' * 301
    @message.valid?
    expect(@message.errors.details[:content][0]).to include(error: :too_long)
  end
end
