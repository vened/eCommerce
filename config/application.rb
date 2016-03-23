require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'sprockets/railtie'
require 'sprockets/es6'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ECommerce
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Moscow'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('ru', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ru

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true


    config.react.addons = true # defaults to false
    Rails.application.config.assets.configure do |env|
      env.register_transformer 'text/ecmascript-6', 'application/javascript', Sprockets::ES6.new('modules' => 'system', 'moduleIds' => true)
    end

    config.react.server_renderer_pool_size ||= 10
    config.react.server_renderer_timeout   ||= 20 # seconds
    config.react.server_renderer           = React::ServerRendering::SprocketsRenderer
    config.react.server_renderer_options   = {
        files:          ["react.js", "components.js"], # files to load for prerendering
        replay_console: true, # if true, console.* will be replayed client-side
    }
  end
end
