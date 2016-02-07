module ComponentsApi
  module RequestRouter
    def self.included(base)
      # base.extend(SingleForwardable)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def register_get(method, *url_variables)
        ensure_service_document #todo

        define_singleton_method(method) do |**args|
          # check parameters
          url_variables.each do |url_variable|
            if !args.keys.include?(url_variable)
              raise ArgumentError.new("key :#{url_variable} missing in call to :#{method} on #{self}")
            end
          end

          env = {}
          env['rack.input'] = Puma::NullIO.new

          env['REQUEST_METHOD'] = 'GET'

          # use service doc for the below as well?
          env['REQUEST_PATH'] = "/wines/#{args[:id]}"
          env['REQUEST_URI'] = "/wines/#{args[:id]}"
          env['PATH_INFO'] = "/wines/#{args[:id]}"

          response = ApplicationApi.call(env)

          status = response[0]
          header = response[1]
          body = response[2].body.first

          struct = OpenStruct.new
          struct.extend(WineRepresenter)
          struct.from_json(body)

        end
        # not sure why I need this in pact_router
        # self.def_delegator self, method, method
      end

      # I can't make too many assumptions around "_should_"
      # because we will probably break those assumptions immediately: hello
      # there should be no _id_ for a post
      def post(url_variables:, body:)
        ensure_service_document

      end

      # id _should_ be included in the url_variables
      #
      def put(id:, url_variables:, body:)
        ensure_service_document
      end

      # should this be instance method
      # we do want to cache this across requests**
      # TBD on a lot of this stuff
      def ensure_service_document
        # make a request to index for service document
        # load this so we can router internal or external
      end

    end
  end
end
