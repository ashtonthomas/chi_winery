class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  # I would like to generate this dynamically
  mount IndexComponentImpl::IndexApi => '/index'

  mount OrderComponentImpl::OrderApi => '/orders/'
  mount OrderComponentImpl::OrderSettingsApi => '/order-settings/'

  mount WineComponentImpl::WineApi => '/wine/wines'

  # Dynamically generate the component index based on the `rake routes`
  mount WineComponentImpl::WineIndexApi => '/wine/index'

  add_swagger_documentation
end

