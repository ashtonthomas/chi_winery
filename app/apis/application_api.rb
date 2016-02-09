class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  # I would like to generate this dynamically
  #
  mount IndexComponentImpl::IndexApi => '/'

  mount OrderComponentImpl::OrderApi => '/orders/'
  mount OrderComponentImpl::OrderSettingsApi => '/order-settings/'

  mount WineComponentImpl::WineApi => '/wine/wines'
  mount WineComponentImpl::WineIndexApi => '/wine/index'

  add_swagger_documentation
end

