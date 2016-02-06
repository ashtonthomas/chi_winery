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
    # At this point, we need a hard convention for
    # mapping the lib/naming => app/naming
    # WineApi::Wines => WineComponent::WinesApi
    #
    # binding.pry


    # ComponentImpl::Concept
    # Component::Concept

    # OrderComponentImpl::Order
    # OrderComponent::Order

    # Order may be confusing, maybe we should add Api

    # OrderComponentImpl::OrderApi
    # OrderComponent::OrderApi

    # and we just pass in the concept here
    # the concept needs to know when component it is part of..
    # maybe we do just extract that our of the name.. :thumbsup:

    false
  end

  private

  attr_accessor :target_concept

end
