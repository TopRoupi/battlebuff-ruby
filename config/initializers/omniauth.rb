# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, ENV['STEAM_KEY']
end
