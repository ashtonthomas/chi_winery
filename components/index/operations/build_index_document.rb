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

    {
      requested_at: Time.now,
      concepts: {
        "WineComponent::WineApi" => wine_info,
      }
    }
  end

  private

end
