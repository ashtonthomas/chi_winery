module ApiClient
  class Wines
    def self.get
      env = {}
      env['rack.input'] = Puma::NullIO.new
      env['REQUEST_METHOD'] = 'GET'
      env['REQUEST_PATH'] = '/orders/hello'
      env['REQUEST_URI'] = '/orders/hello'

      binding.pry
      response = ApplicationApi.call(env)

      # WinesComponent::Wines.call

    end
  end
end