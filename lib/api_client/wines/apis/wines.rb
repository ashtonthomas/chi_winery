module WinesApi
  class Wines
    def self.get(id: nil)
      env = {}
      env['rack.input'] = Puma::NullIO.new
      env['REQUEST_METHOD'] = 'GET'
      env['REQUEST_PATH'] = '/wines'
      env['REQUEST_URI'] = '/wines'
      env['PATH_INFO'] = '/wines'

      response = ApplicationApi.call(env)

      status = response[0]
      header = response[1]
      body = response[2].body.first

      # body_parsed = JSON.parse(body)

      # @request = Rack::Request.new(env)
      # WinesComponent::Wines.call

      wine = Wine.new
      wine.extend(WineRepresenter)
      wine.from_json(body)
    end
  end
end
