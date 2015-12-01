module WineApi
  class Wines
    def self.get(id: nil)
      # if spec, do something else?

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

      # TODO
      # compare this body json to that of the factory wine to_json (**)

      binding.pry # Hash vs Hashie::Mash
      # looks like we really don't need the shared representer
      # what value is it going to add

      WineRepresenter.new(JSON.parse(body))


    end
  end
end
