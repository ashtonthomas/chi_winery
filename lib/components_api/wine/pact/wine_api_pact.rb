module WineComponent # may not really need to nest under this
  module WineApiPact
    include Mondavi::PactRouter

    pact_for WineComponent::WineApi

    pact :get, "{:id=>1}", Hashie::Mash.new(
      representer: WineRepresenter,
      response: {
        name: "Some Robert Mondavi Classic",
        vintage: 1966
      }
    )
  end
end
