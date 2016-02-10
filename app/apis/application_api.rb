class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  # I would like to generate this dynamically
  mount IndexComponent::IndexApiImpl => '/index'

  mount OrderComponent::OrderApiImpl => '/orders/'
  mount OrderComponent::OrderSettingsApiImpl => '/order-settings/'

  mount WineComponent::WineApiImpl => '/wine/wines'

  # Dynamically generate the component index based on the `rake routes`
  mount WineComponent::WineIndexApiImpl => '/wine/index'

  add_swagger_documentation
end

