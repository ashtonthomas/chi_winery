module OrdersComponent
  class OrdersApi < Grape::API

    resource :hello do
      desc 'Return a Hello World message'
      get do
        binding.pry
        sample_order = OrdersComponent::ShowSampleOrder.new(name: "Coffee", quantity: 15)
        { message: sample_order.call }
      end
    end

  end
end

