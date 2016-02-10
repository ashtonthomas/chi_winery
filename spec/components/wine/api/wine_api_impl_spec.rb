require 'spec_helper'

def app
  ApplicationApi
end

describe WineComponent::WineApiImpl do
  include Rack::Test::Methods

  # These producer specs will need to draw from both:
  # 1) pact (the parameters and stub)
  # 2) service document (this is still TBD)
  # I will need to combine these things in the main api specs

  # service document will also nee to be used in front-end Angular2/GWT app?

  describe 'GET' do
    it 'does something' do
      # get '/wines/1'
    end
  end
end
