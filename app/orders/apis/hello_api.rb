class HelloApi < Grape::API

  resource :hello do
    desc 'Return a Hello World message'
    get do
      sample_order = ShowSampleOrder.new("Coffee", 15)
      { message: sample_order.call }
    end
  end

end
