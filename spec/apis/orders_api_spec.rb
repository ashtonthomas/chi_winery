require 'spec_helper'

def app
  ApplicationApi
end

describe OrdersComponent::OrdersApi do
  include Rack::Test::Methods

  describe 'GET /hello' do
    it 'returns a hello world message' do
      binding.pry
      get '/orders/hello'
      expect(response_body).to eq({ message: 'Hello Wonderful World, from ChiWinery!' }.to_json)
    end
  end

end
