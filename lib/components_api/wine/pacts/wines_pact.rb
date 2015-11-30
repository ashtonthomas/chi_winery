module WineComponent
  module WinesPact
    include PactBuilder



    #method name, method verb, param_string

    pact :get, "{:id=>1}" do |wine|

    end

    module Get

      # SUPPORTED_PRECONDITIONS = [
      #   Preconditions::SomeContext::SomeSpecialCondition
      # ]

      # Pact::WineComponent::Wines::Get.preconditions
      # can we use some meta programming to just call #preconditions (?)
      # need to map parameters to result hash


      pact "{:id=>1}" do |wine|
        wine.name = "A Mocked Wine Name"
        wine.vintage = 1966
      end

      def self.mock(parameter_string)
        # this method can be completely dynamic
      end


    end

  end
end
