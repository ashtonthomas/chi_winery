class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount OrdersApi => '/orders/'
  mount WinesApi => '/wines/'

  add_swagger_documentation
end

