module SugarComponent
  class SugarApi
    include Mondavi::RequestRouter

    # Fake/mock/test external request
    register_get :get, :id
  end
end
