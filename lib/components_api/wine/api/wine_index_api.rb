module WineComponent
  class WineIndexApi
    include Mondavi::RequestRouter

    register_get :get, :url, :urn_path
  end
end
