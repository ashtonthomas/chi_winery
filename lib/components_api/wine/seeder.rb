module ApiClient
  module Wines
    class Seeder
      def self.load_seeds
        # use factory_girl to load shit into the database
        # well that's only if this is the machine that hosts the api
        # unless we want to support having the component on multiple machines
        # we just care about stubbing
        # can we use the factory to stub the request?
        # can we trigger the Mock/Stub automatically
        # ..?


      end
    end
  end
end
