module OrderComponent
  class OrdersApi < Grape::API

    resource :hello do
      desc 'Return a Hello World message'
      get do

        # testing: hit /orders/hello
        wine = WineApi::Wines.get(id: 1)

        # Okay, now what if I want to talk to order-settings?
        # Do I need to go through the ApiClient?
        # What's the point in having it in this same arbitrary "component"?

        # What's the difference between a model-backed api and a non-model api call
        # are these just operations?
        # normally not, normally we are interacting with data

        # so what's an example of a non-model-backed concept/operation exposed via the API?
        # Search?
        # Should search ever be coupled to a model?
        # search for just this model? by a known attribute?
        # maybe search should never be tied to a model
        # so if I wanted to search for orders:
        # order_search_api.rb
        #
        # Settings could be the same as "search"
        # if we have some concept of a setting, let's scope it into it's on api
        # but we think it can stay in this family
        # ApiClient::OrderSettings.cdall_public_method(foo: 'bar')

        # OrdersComponent - when will I ever usd this besides requiring the files and hooking them into app_api.rb?
        # OrdersApi::Orders
        # WinesApi::Wines.get(id: 1)

        sample_order = OrderComponent::ShowSampleOrder.new(name: "Coffee (but pair with: #{wine.represented.name})", quantity: 15)
        { message: sample_order.call }
      end
    end

  end
end

