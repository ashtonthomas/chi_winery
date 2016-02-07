module ComponentsApi
  module RequestRouter
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def register_get(method, *declared_url_variables)
        define_singleton_method(method) do |**supplied_url_variables|
          # check parameters
          declared_url_variables.each do |required_url_variable|
            if !supplied_url_variables.keys.include?(required_url_variable)
              raise ArgumentError.new("key :#{required_url_variable} missing in call to :#{method} on #{self}")
            end
          end

          ensure_service_document

          is_local = IsLocalComponent.call(target_concept: self)

          if is_local
            # mock request and satisfy locally
            issue_local_request(
              http_verb: 'GET',
              url_template: "https://chi-winery.herokuapp.com",
              urn_path: urn_path(supplied_url_variables)
            )
          else
            # issue external request
            binding.pry # todo

            # will need to get the url from svc-doc

          end

        end
        # not sure why I need this in pact_router
        # self.def_delegator self, method, method
      end

      def index?
        self == IndexComponent::IndexApi
      end

      def urn_path(supplied_url_variables)
        return "/" if index?

        # @@service_document should never have a representer
        # so it will just be a hashie::mash
        details = @@service_document.concepts[self.to_s]

        details.url_template
        path = details.urn_path_template

        supplied_url_variables.each do |url_variable_key, url_variable_value|
          path.gsub!(":#{url_variable_key}", url_variable_value.to_s)
        end

        path
      end

      def issue_local_request(http_verb: nil, url_template: nil, urn_path: nil)
        env = {}
        env['rack.input'] = Puma::NullIO.new

        env['REQUEST_METHOD'] = http_verb
        env['REQUEST_PATH'] = urn_path
        env['REQUEST_URI'] = urn_path
        env['PATH_INFO'] = urn_path

        response = ApplicationApi.call(env)

        status = response[0]
        header = response[1]
        body = response[2].body.first

        begin
          extract_representer = self.to_s.gsub(/^.*::/, '').gsub('Api', 'Representer')
          representer = Object.const_get(extract_representer)

          struct = OpenStruct.new
          struct.extend(WineRepresenter)
          struct.from_json(body)
        rescue NameError => e
          # Representer doesn't exist, use Hashie::Mash
          Hashie::Mash.new(JSON.parse(JSON.load(body)))
        end
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

      def ensure_service_document
        return if index?

        if @@service_document.nil? || service_document_expired?
          @@service_document = IndexComponent::IndexApi.get
        end
      end

      def service_document_expired?
        return true unless @service_document
        Time.parse(@@service_document.requested_at) < (Time.now - 24.hours)
      end

    end
  end
end
