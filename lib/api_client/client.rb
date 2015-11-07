class ApiClient::Client


  def self.issue_request(method:, url:, options:)

    request = Request.new(method: method, url: url, options: options)
    # request.call

    # self.trace_id = Imprint::Tracer.get_trace_id.to_s.dup
    #
    # foo = execute_in_actor_thread do |foo, bar|
    #   binding.pry # here
    # end
    #
    #
    # foo.extend(FutureWrapper) #wut is dis?

  end

  def self.request_url

  end

  def self.execute_in_actor_thread(&block)
    Celluloid::Future.new do
      begin
        yield
      rescue => e
        Honeybadger.notify(e, context: { method: method,
                                         url: url,
                                         options: options,
                                         response_status: response.try(:status),
                                         response_body: response.try(:body) }) if defined?(Honeybadger)
        raise e
      end
    end
  end


end