module WineComponent
  class WineApi
    include Mondavi::RequestRouter

    # register_[http_verb] method_name, url_variables
    register_get :get, :id
    register_get :hello, :blah
    register_get :get_foo, :id, :fu, :bar
  end
end
