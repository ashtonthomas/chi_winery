module WineComponent
  class WineIndexApi
    include ComponentsApi::RequestRouter

    register_get :get, :url, :urn_path
  end
end
