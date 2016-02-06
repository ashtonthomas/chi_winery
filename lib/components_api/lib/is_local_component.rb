# support a resource file for development use
# while in development, we may
class IsLocalComponent
  include Operation
  # revisit this thought (may not be needed)

  # We know we want to mock everything in specs
  # but we may not want to mock everything in dev
  # We we probably want to mock out everything that
  # is not supposed to be on this app/component-group
  # So I guess we also mock everything in development
  # _except_ for those that, as developers, we _know_ are
  # going to be in the same component group (in this code base)

  # I guess we could just do this intelligently
  # as we just look to see if the api files are in the main
  # components folder (not inside lib, but inside this app)

  # At this point we will be really coupling our layout to this
  # framework-thing-a-ma-thingy

  def initialize(target_concept:)
    @target_concept = target_concept
  end

  def call()
    # OrderComponentImpl::OrderApi
    # OrderComponent::OrderApi

    # target_concept extract concept
    begin
      impl = @target_concept.to_s.gsub("Component", "ComponentImpl")
      Object.const_get(impl)

      return true
    rescue NameError => e
      return false
    end
  end

  private

  attr_accessor :target_concept

end
