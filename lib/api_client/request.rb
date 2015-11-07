module ApiClient
  class Request
    include Celluloid::IO
    attr_accessor :trace_id

    def initialize(method:, url:, *options)
      @method = method
      @url = url
      @options = options

    end
  end
end