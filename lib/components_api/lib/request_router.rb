module ComponentsApi
  module RequestRouter
    def self.included(base)
      # base.mattr_accessor :request_methods
      # base.request_methods = Hashie::Mash.new
      # binding.pry
      base.extend(SingleForwardable)
      base.extend(ClassMethods)

      # TODO
      # just have the WineComponent::WineApi just extend a class
      # it will clean a lot of this shit up
    end

    module ClassMethods

      def requests_for(concept)

      end

      # def request(method, arguments)
      # end

      # so something like /wine/hello/:foo/blah is hard to do
      # we have to do it in terms of a concept + verb
      # so the above could be concept FooBlah
      # and above is the url_template
      # BUT, if I don't want to create a new concept that is more
      # in line with our normal helper methods,
      # can we allow you to define something else

      # def get(method:, url_variables:)
      #   # but we still need to rely on the service_document to tell use about this
      #   # so we can't do much except know concept name and the url_variables

      #   # so this would give us:
      #   # WineComponent::WineApi.hello(url_variables: { foo: 123 })
      #   binding.pry

      #   define_singleton_method(method) do |args|
      #     # create this method
      #     binding.pry
      #   end

      #   self.def_delegator self, method, method

      # end

      # def get(method: :get, id: nil, url_variables: nil)
      def register_get(method, *url_variables)
        ensure_service_document #todo

        define_singleton_method(method) do |**args|
          # check parameters
          url_variables.each do |url_variable|
            if !args.keys.include?(url_variable)
              raise ArgumentError.new("key :#{url_variable} missing in call to :#{method} on #{self}")
            end
          end

          # Now return the correct values
          mash = Hashie::Mash.new
          mash.name = "Got it!"
          mash

        end
        # not sure why I need this in pact_router
        # self.def_delegator self, method, method
      end

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
