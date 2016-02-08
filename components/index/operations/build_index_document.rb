class BuildIndexDocument
  include Operation

  # Since, I need to know what components are local
  # (see notes in pact_router)
  # so we don't mock, but instead let the request_router do its thing
  # I'm going to need an index for each compoent
  # (for the pact_router to check)
  # we should be able to utilize that for satisfying this operation
  # (that will _may_ require service calls to each component)
  # but the index component is just another component
  # and may live anywhere (chicken and egg??)

  # so every client/server knows how to get to the index
  # and the index knows how to get to the index of every other component

  def call

    # corresponds to the urls in ApplicationApi
    wine_info = WineComponent::WineIndexApi.get(
      url: 'https://chi-winery.herokuapp.com',
      urn_path: '/wine/index'
    )

    # sugar_info = SugarComponent::SugarIndexApi.get(
    #   url: 'https://other-app-chi-winery.herokuapp.com',
    #   urn_path: '/sugar/index'
    # )

    sugar_info = {
      # app_name: "app-1-chi-winery", #app name may no longer be needed if we use get_const
      url_template: "https://app-1-chi-winery.herokuapp.com",
      urn_path_template: "/sugar/sugar-producer/:id",
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
    }

    {
      requested_at: Time.now,
      concepts: {
        "WineComponent::WineApi" => wine_info,
        "SugarComponent::SugarApi" => sugar_info
      }
    }
  end

  private

end
