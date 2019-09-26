require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'is valid with content and player' do
    expect(build(:message)).to be_valid
  end

  it 'is invalid without a content' do
    message = build(:message, content: nil)
    message.valid?
    expect(message.errors.details[:content]).to include(error: :blank)
  end

  it 'is invalid with a empty content' do
    message = build(:message, content: '  ')
    message.valid?
    expect(message.errors.details[:content]).to include(error: :blank)
  end

  it 'is invalid without a player' do
    message = build(:message, player: nil)
    message.valid?
    expect(message.errors.details[:player]).to include(error: :blank)
  end

  it 'is invalid with a content greater than 300' do
    message = build(:message, content: ('0' * 301))
    message.valid?
    expect(message.errors.details[:content][0]).to include(error: :too_long)
  end
end
