require 'request'

module ApiClient
  require 'init'

  require 'orders/apis/orders'

  DISTRIBUTED_ENVIRONMENTS = %w(staging production)

  if (ENV['SERVICES_DOMAIN_NAME'].nil? || ENV['SERVICES_DOMAIN_NAME'].empty?) &&
      DISTRIBUTED_ENVIRONMENTS.include?(ENV['RAILS_ENV'] || ENV['RACK_ENV'])

    Honeybadger.notify(context: {
        message: 'SERVICES_DOMAIN_NAME environment variable not set.',
        environment: (ENV['RAILS_ENV'] || ENV['RACK_ENV'])
    }) if defined?(Honeybadger)
  end
end