module SugarComponent
  class SugarIndexApi
    include ComponentsApi::RequestRouter

    register_get :get, :url, :urn_path
  end
end
