# we can easily use ruby modules
# to nest things like we want
# to make this possible:
# Pact::WineComponent::Wines.get(foobar)
module Pact
  module WineComponent
    module Wines
      def get(params_hash)

      end
    end
  end
end
