module PactBuilder

  def self.included(base)
    base.mattr_accessor :pacts
    base.pacts = Hashie::Mash.new

    base.extend(ClassMethods)
  end

  module ClassMethods
    # Let's override the methods to take the args
    # convert to string and use that to look up the stub response
    # run the stup response through the desired representer
    def pact_for concept
      concept.extend(SingleForwardable)

      concept.methods(false).each do |method|
        define_singleton_method(method) do |args|
          parameter_string = args.to_s

          stub = pacts[method][parameter_string]
          # TODO: helpful error message if key not found

          representer = stub.representer
          response = stub.response

          representer.new(response)
        end
        concept.def_delegator self, method, method
      end
    end

    def pact method_name, parameter_string, stub
      pacts[method_name.to_s] = { parameter_string => stub }
    end
  end
end
