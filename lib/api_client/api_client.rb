require_relative 'request'

module ApiClient
  require_relative 'init'

  require_relative 'orders/apis/orders_api'
  require_relative 'wines/apis/wines_api'
  require_relative 'wines/representers/wine_representer'


  DISTRIBUTED_ENVIRONMENTS = %w(staging production)

  if (ENV['SERVICES_DOMAIN_NAME'].nil? || ENV['SERVICES_DOMAIN_NAME'].empty?) &&
      DISTRIBUTED_ENVIRONMENTS.include?(ENV['RAILS_ENV'] || ENV['RACK_ENV'])

    # TODO remove RAILS_ENV at some point if possible [act]
    Honeybadger.notify(context: {
        message: 'SERVICES_DOMAIN_NAME environment variable not set.',
        environment: (ENV['RAILS_ENV'] || ENV['RACK_ENV'])
    }) if defined?(Honeybadger)
  end
end
