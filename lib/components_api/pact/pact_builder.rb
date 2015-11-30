module PactBuilder
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def foo
      "hello foo master"
    end

    def pact(method, parameter_string, &block)
      binding.pry
    end
  end
end
