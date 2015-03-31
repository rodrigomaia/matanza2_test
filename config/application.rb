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

    t1k.configure do |config|
      config[:github_user] = 'rodrigomaia'
      config[:github_repo] = 'matanza2_test'
      config[:github_oauth_token] = ENV["GITHUB_TOKEN"]
      config[:trello_developer_public_key] = ENV["TRELLO_KEY"]
      config[:trello_member_token] = ENV["TRELLO_TOKEN"]
      config[:trello_user_name] = 'rudrige'
      config[:trello_board_name] = 'MATANZA'
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
