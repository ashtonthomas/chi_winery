module WineApi
  class Wines
    include MockParameterHelpers

    def self.get(**parameters)
      # mock_pre_conditions: is options has of special conditions
      # so in order to pass a pre_condition, you have to be testing
      # the api direclty, it can't be an indirect or test at a different level
      # this may be a good thing to enforce


      # I need to do something to make this test:
      # 1) The consuming component
      # 2) The producing component

      # map: params -> particular factory
      # binding.pry
      # binding
      # mock_factory_name(self, __method__)
      # FactoryGirl.build(:wine, wines_api_wines_get_id_nil)

      # I don't need Factory girl
      # I really just need Hashie::Mash?

      # use the keys in the test hash
      # to validate the values coming from the actual service
      # cool??

      wine = Wine.new
      wine.extend(WineRepresenter)

      # I don't know how to handle pre_conditions yet (?)
      mock_pre_conditions = parameters.delete(:mock_pre_conditions)
      parameter_string = parameters.to_s

      # stub_response = WineComponent::Wines::Pact.get(method: :get, parameter_string)

      wine.from_json(stub_response.to_json)

    end
  end
end
