module MockParameterHelpers

  def self.included(base)
    base.methods(false)
    # base.extend(ClassMethods)

  end

  module ClassMethods
    def params(foo, method)
      binding.pry
      args = method(__method__).parameters.map { |arg| arg[1] }

    end
  end
end
