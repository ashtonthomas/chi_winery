class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount IndexComponent::IndexApi => '/'

  mount OrderComponent::OrdersApi => '/orders/'
  mount OrderComponent::OrderSettingsApi => '/order-settings/'
  mount WineComponent::WinesApi => '/wines/'
  mount WineComponent::WineIndexApi => '/wines/'

  add_swagger_documentation
end

