module OrdersComponent
  class OrdersApi < Grape::API

    resource :hello do
      desc 'Return a Hello World message'
      get do

        # testing: hit /orders/hello
        wine = ApiClient::Wines.get(id: 1)

        sample_order = OrdersComponent::ShowSampleOrder.new(name: "Coffee (but pair with: #{wine.name})", quantity: 15)
        { message: sample_order.call }
      end
    end

  end
end

