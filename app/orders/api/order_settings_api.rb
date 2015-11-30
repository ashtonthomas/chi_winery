module OrdersComponent
  class OrderSettingsApi < Grape::API

    resource :hello do
      desc 'Return Order Settings message'
      get do

        # testing: hit /orders/hello
        # wine = ApiClient::WinesApi.get(id: 1)

        # sample_order = OrdersComponent::ShowSampleOrder.new(name: "Coffee (but pair with: #{wine.name})", quantity: 15)
        { message: "some order settings" }
      end
    end

  end
end

