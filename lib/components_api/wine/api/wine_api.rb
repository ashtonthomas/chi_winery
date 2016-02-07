# 1) Spec: return pact (always)
# 2) Local: mock request and fulfill locally
# 3) Foreign: use ServiceDocument to request
module WineComponent
  class WineApi
    include ComponentsApi::RequestRouter

    # first parameter is the method name to be called
    # the remaining are the url_variables
    # WineComponent::WineApi.hello(blah: "yolo")
    register_get :get, :id
    register_get :hello, :blah
    register_get :get_foo, :id, :fu, :bar

  end
end
