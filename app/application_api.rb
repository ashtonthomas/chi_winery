class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount OrderComponent::OrdersApi => '/orders/'
  mount OrderComponent::OrderSettingsApi => '/order-settings/'
  mount WineComponent::WinesApi => '/wines/'

  add_swagger_documentation
end

