# load bundler
require 'bundler/setup'
Bundler.setup(:default)
require 'napa/setup'
Bundler.require(:default, Napa.env.to_sym)
require 'napa'

# load environment
Napa.load_environment

# autoload initalizers
Dir['./config/initializers/**/*.rb'].map { |file| require file }

# load middleware configs
Dir['./config/middleware/**/*.rb'].map { |file| require file }

# autoload app
relative_load_paths = %w(
  components/index
  components/order
  components/wine
  lib/components_api
  app/
)

ActiveSupport::Dependencies.autoload_paths += relative_load_paths

# Do I need to call this class so
# all the other requires are evaluated?
ComponentsApi
