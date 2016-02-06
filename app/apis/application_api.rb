class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount IndexComponentImpl::IndexApi => '/'

  mount OrderComponentImpl::OrderApi => '/orders/'
  mount OrderComponentImpl::OrderSettingsApi => '/order-settings/'

  mount WineComponentImpl::WineApi => '/wines/'
  mount WineComponentImpl::WineIndexApi => '/wines/'

  add_swagger_documentation
end

