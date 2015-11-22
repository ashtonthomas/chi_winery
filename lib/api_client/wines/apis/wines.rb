module ApiClient
  class Wines
    def self.get(id: nil)
      env = {}
      env['rack.input'] = Puma::NullIO.new
      env['REQUEST_METHOD'] = 'GET'
      env['REQUEST_PATH'] = '/wines/hello'
      env['REQUEST_URI'] = '/wines/hello'
      env['PATH_INFO'] = '/wines/hello'

      response = ApplicationApi.call(env)

      binding.pry
      
      # @request = Rack::Request.new(env)
      # WinesComponent::Wines.call

    end
  end
end