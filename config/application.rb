require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Matanza2Test
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    T1k.setup do |config|
      # Change the repository adapter. Default is github.
      # config.repository.adapter = :github

      # Change the tracker adapter. Default is trello.
      # config.tracker.adapter = :trello

      # Configuring your repository
      config.repository.setup do |c|
        # https://github.com/settings/applications
        # Personal access tokens
        c.oauth_token = ENV["GITHUB_TOKEN"]
        c.user = 'rodrigomaia'
        c.repo = 'matanza2_test'
      end

      # Configuring your tracker
      config.tracker.setup do |c|
        # https://trello.com/app-key
        # https://trello.com/1/connect?key=YOUR_KEY&name=BOARD_NAME&expiration=never&response_type=token&scope=read,write
        c.developer_public_key = ENV["TRELLO_KEY"]
        c.member_token = ENV["TRELLO_TOKEN"]
        c.user_name = 'rudrige'
        c.board_name = 't1k'
      end
    end

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
