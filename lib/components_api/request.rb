module ApiClient
  class Request
    include Celluloid::IO
    attr_accessor :trace_id

    def initialize(method: nil, url: nil, args: nil)
      @method = method
      @url = url
      @options = args
    end
  end
end