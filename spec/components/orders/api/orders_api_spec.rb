require 'spec_helper'

def app
  ApplicationApi
end

describe OrderComponent::OrdersApi do
  include Rack::Test::Methods

  describe 'GET /hello' do
    it 'returns a hello world message' do
      get '/orders/hello'
      expect(response_body).to eq({ message: "Here is Cool Coffee (but pair with: Some Robert Mondavi Classic) order for a quantity of 15" }.to_json)
    end
  end

end
