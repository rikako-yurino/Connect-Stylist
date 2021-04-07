require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Personalstylist
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.default_locale = :ja
    config.time_zone = 'Asia/Tokyo'
    config.active_job.queue_adapter = :delayed_job

    config.generators.system_tests = nil
  end
end
