require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Geretps
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.available_locales = :pt
    config.i18n.default_locale = :pt
    config.i18n.locale = :pt
    I18n.enforce_available_locales = false

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        :authentication => :plain,
        :address => "smtp.mailgun.org",
        :port => 587,
        :domain => "andbox19136.mailgun.org",
        :user_name => "postmaster@sandbox19136.mailgun.org",
        :password => "84azr7l0j3p6"
        }
    end
end
