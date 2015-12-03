require 'spec_helper'

def app
  ApplicationApi
end

describe WineComponent::WinesApi do
  include Rack::Test::Methods

  # These producer specs will need to draw from both:
  # 1) pact (the parameters and stub)
  # 2) service document (this is still TBD)
  # I will need to combine these things in the main api specs

  describe 'GET' do
    it 'does something' do
      get '/wines/1'
      binding.pry
    end
  end
end
