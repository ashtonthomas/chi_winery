require 'spec_helper'

def app
  ApplicationApi
end

describe OrderComponent::OrderApiImpl do
  include Rack::Test::Methods

  describe 'GET /hello' do
    it 'returns a hello world message' do
      # Test out Naught
      NullObject = Naught.build do |config|
        # config.mimic SomeClass
        # config.impersonate SomeOtherClass
        config.pebble
        config.singleton
        config.traceable
        config.black_hole
        config.define_explicit_conversions
        config.define_implicit_conversions
        config.predicates_return false

        # if $DEBUG
        #   config.traceable
        # else
        #   config.singleton
        # end

        def customer_meth(*args, **kargs)
          binding.pry
        end

        def nil?
          true
        end

        def ==(other)
          return true if other.nil?
          binding.pry
        end

        # include NullObject::Conversions
        # Maybe(foo) #?
      end

      null = NullObject.get

      # TODO - figure this out
      if null && true
        # raise "Should NullObject evaluate to false right here?"
      end


      get '/orders/hello'

      # wine_name = WinePact::WinesPact.get(id: 1).name
      wine_name = "Some Robert Mondavi Classic"
      message = "Here is Cool Coffee (but pair with: #{wine_name}) order for a quantity of 15"

      expect(response_body).to eq({ message: message }.to_json)
    end
  end

end
