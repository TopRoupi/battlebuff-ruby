# frozen_string_literal: true

Rails.application.configure do # rubocop:disable Metrics/BlockLength
  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Store uploaded files on the local file system in a temporary directory
  config.active_storage.service = :test

  config.action_mailer.perform_caching = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # omni auth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:steam] = OmniAuth::AuthHash.new(
    provider: 'steam',
    uid: '76561198010202071',
    info: {
      nickname: 'Reu',
      name: 'Rodrigo Navarro',
      location: 'BR',
      image: 'http://media.steampowered.com/steamcommunity/public/images/avatars/3c/3c91a935dca0c1e243f3a67a198b0abea9cf6d48_medium.jpg',
      urls: {
        Profile: 'http://steamcommunity.com/id/rnavarro1/'
      }
    },
    credentials: {},
    extra: {
      raw_info: {
        steamid: '76561198010202071',
        communityvisibilitystate: 3,
        profilestate: 1,
        personaname: 'Reu',
        lastlogoff: 1_325_637_158,
        profileurl: 'http://steamcommunity.com/id/rnavarro1/',
        avatar: 'http://media.steampowered.com/steamcommunity/public/images/avatars/3c/3c91a935dca0c1e243f3a67a198b0abea9cf6d48.jpg',
        avatarmedium: 'http://media.steampowered.com/steamcommunity/public/images/avatars/3c/3c91a935dca0c1e243f3a67a198b0abea9cf6d48_medium.jpg',
        avatarfull: 'http://media.steampowered.com/steamcommunity/public/images/avatars/3c/3c91a935dca0c1e243f3a67a198b0abea9cf6d48_full.jpg',
        personastate: 1,
        realname: 'Rodrigo Navarro',
        primaryclanid: '103582791432706194',
        timecreated: 1_243_031_082,
        loccountrycode: 'BR'
      }
    }
  )
end
