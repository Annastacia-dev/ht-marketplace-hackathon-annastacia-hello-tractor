require_relative "boot"

require 'will_paginate/array'
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HelloTractor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Sidekiq
    Sidekiq.configure_client do |config|
      config.redis = {
        url: ENV['REDISCLOUD_URL'],
        network_timeout: 5
      }
    end

    Sidekiq.configure_server do |config|
      config.redis = {
        url: ENV['REDISCLOUD_URL'],
        network_timeout: 5
      }
    end
  end
end
