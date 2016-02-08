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

    # So our clients break HATEOAS as it knows about:
    # - resource: WineApi
    # - method: :do_cool
    # - url_variables: :id, :foo, :bar
    # This is fine. It let's up valdiate the request when it is called
    # (so this _can_ get out of sync with the svc-doc, but that would point to a no-no)
    # API changes should happen slowly
    # but we could alert immediately if the svc-doc returns with something
    # incompatible
    # But what _do_ we get:
    # -- quietly stop using variables
    # -- change order or structure of url + variables at will (when moving components or just changing the routing)
    # -- can determine the time range to support old of new (but optional) variables
    #
    # register_get :do_cool, url_variables: [id, :foo, :bar]

  end
end
