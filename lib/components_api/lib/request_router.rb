module ComponentsApi
  module RequestRouter
    def self.included(base)
      base.mattr_accessor :request_methods
      base.request_methods = Hashie::Mash.new
      # binding.pry
      # need to dynamically define class methods
      # which call the instance method

      base.extend(ClassMethods)
    end

    # so when we load everything up,
    # I want to dynamically build the methods to
    # go locally
    # or go external
    # of (if development) go mock
    # but the go mock should work like spec
    # where they both just override the mehtods created here
    # for all external calls


    module ClassMethods

      # rake roues => [METHOD, URL_TEMPLATE]

      def requests_for(concept)

      end

      # def request(method, arguments)
      # end

      # def get(id:, url_variables: nil)
        # ensure_service_document

      # end

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
