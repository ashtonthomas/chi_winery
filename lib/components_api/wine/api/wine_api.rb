# 1) Spec: return pact
# 2) Local: mock request
# 3) Foreign: use ServiceDocument to request
module WineComponent
  class WineApi
    include ComponentsApi::RequestRouter

    requests_for :wine # the concept name

    # get :id


    def self.get(id: nil)
      env = {}
      env['rack.input'] = Puma::NullIO.new
      env['REQUEST_METHOD'] = 'GET'

      # use service doc for the below as well?
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

    def self.hello(id: nil, foo: nil)

    end
  end
end
