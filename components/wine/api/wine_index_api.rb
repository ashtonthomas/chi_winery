module WineComponentImpl
  class WineIndexApi < Grape::API
    # This can be dynamically generated using the Grape::API
    # and then teh AppName/AppURL...
    get '/' do
      {
        app_name: "app-1-chi-winery", #app name may no longer be needed if we use get_const
        url_template: "https://app-1-chi-winery.herokuapp.com",
        urn_path_template: "/wine/wines/:id",
        url_variables: {
          id: "the ID of the wine"
        },
        formats: [
          :xml,
          :json,
          :binary,
          :txt
        ],
        available_methods: [:get, :put, :post, :delete],
      }.to_json
    end
  end
end
