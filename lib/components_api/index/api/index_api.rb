module IndexComponent
  class IndexApi
    # Do we need to make an exception for the index call?
    # Is there a chicken and egg problem?
    # I don't think so
    # we just make that request (and cache for 24/48 hours)
    include ComponentsApi::RequestRouter

    # but we don't need to follow the same format
    # because we know we are always making the external request
    # requests_for :index

    # Hey, can I do somthing like the mocking/stubbing while in developemnt?

    register_get :get



  end
end
