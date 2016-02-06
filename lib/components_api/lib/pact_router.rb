# rename this to PactRouter?
module ComponentsApi
  module PactRouter

    def self.included(base)
      base.mattr_accessor :pacts
      base.pacts = Hashie::Mash.new
      base.extend(ClassMethods)

      # Okay, so we actually need to know when components are "local"
      # So we _don't_ override this, we just let the RequestRouter do its thing

      # Actually, no on all of that ^
      # We should **always** mock out component-to-component communication******

      # so, no cross component communication in specs (ever)
      # so, while in a component, don't ever use the public API.
      # that should only ever be for HTTP requests
      # Everything else should happen in an operation (internally)
      # that makes sense.
    end

    module ClassMethods
      def pact_for concept
        is_test = ENV['RACK_ENV'] == 'test'
        is_external = IsLocalComponent.call(target_concept: concept)

        if is_test || is_external
          mock(concept)
        end
      end

      def mock(concept)
        concept.extend(SingleForwardable)

        concept.methods(false).each do |method|
          define_singleton_method(method) do |args|
            stub = extract_stub(self, concept, method, args)

            representer = stub.representer
            response = stub.response

            return extract_concept(representer, response)
          end
          concept.def_delegator self, method, method
        end
      end

      def extract_stub(pact_class, concept, method, args)
        parameter_string = args.to_s

        if !pacts.has_key?(method) || !pacts[method].has_key?(parameter_string)
          raise "#{pact_class} does not have #{concept} pact for method ':#{method}' with id key: '#{parameter_string}'"
        end

        pacts[method][parameter_string]
      end

      def extract_concept(representer, response)
        struct = OpenStruct.new
        struct.extend(representer)
        struct.from_hash(response)
      end

      def pact method_name, parameter_string, stub
        pacts[method_name.to_s] = { parameter_string => stub }
      end
    end
  end
end