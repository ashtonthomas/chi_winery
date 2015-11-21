class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount OrdersComponent::OrdersApi => '/orders/'
  mount WinesComponent::WinesApi => '/wines/'

  add_swagger_documentation
end

