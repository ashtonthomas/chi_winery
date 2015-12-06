module WineApi
  class Wines
    def self.get(id: nil)
      # if spec, do something else?

      env = {}
      env['rack.input'] = Puma::NullIO.new
      env['REQUEST_METHOD'] = 'GET'
      env['REQUEST_PATH'] = "/wines/#{id}"
      env['REQUEST_URI'] = "/wines/#{id}"
      env['PATH_INFO'] = "/wines/#{id}"

      response = ApplicationApi.call(env)

      status = response[0]
      header = response[1]
      body = response[2].body.first

      struct = OpenStruct.new
      struct.extend(WineRepresenter)
      struct.from_json(body)
    end
  end
end
