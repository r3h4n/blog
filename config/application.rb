require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  # config.assets.initialize_on_precompile = false
<<<<<<< HEAD
  config.action_cable.mount_path = '/cable'
=======
  config.action_cable.mount_path = "/cable"
>>>>>>> 3fbe1046d29e92ab73039366db81cab52d36d264
  end
end
