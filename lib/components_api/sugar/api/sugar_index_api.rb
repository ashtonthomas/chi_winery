module SugarComponent
  class SugarIndexApi
    include Mondavi::RequestRouter

    register_get :get, :url, :urn_path
  end
end
