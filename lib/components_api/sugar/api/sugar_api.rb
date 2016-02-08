module SugarComponent
  class SugarApi
    include ComponentsApi::RequestRouter

    # Fake/mock/test external request
    register_get :get, :id
  end
end
