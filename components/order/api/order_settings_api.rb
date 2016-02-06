module OrderComponent
  class OrderSettingsApi < Grape::API
    # the following declarations are equivalent to the defaults

    content_type :xml, 'application/xml'
    content_type :json, 'application/json'
    content_type :binary, 'application/octet-stream'
    content_type :txt, 'text/plain'

    # default_format :txt
    default_format :json


    resource :blueberries do
      desc 'Return Order Settings message'
      get do

        # testing: hit /orders/hello
        # wine = ApiClient::WinesApi.get(id: 1)

        # sample_order = OrdersComponent::ShowSampleOrder.new(name: "Coffee (but pair with: #{wine.name})", quantity: 15)
        { message: "some order settings" }
      end
    end

    resource :blah do
      desc 'Return a Hello World message'
      get do
        { message: "blah!" }
      end
    end

    # GET /order-settings/level1/level2/:id/:type(.json) #
    resource :level1 do
      namespace :level2 do
        route_param :id do
          route_param :type do
            get do
              "you found it!"
            end
          end
        end
      end
    end

  end
end

