module WinePact
  module WinesPact
    include ComponentsApi::PactRouter

    pact_for WineApi::Wines

    pact :get, "{:id=>1}", Hashie::Mash.new(
      representer: WineRepresenter,
      response: {
        name: "Some Robert Mondavi Classic",
        vintage: 1966
      }
    )

    # get id: 1

  end
end
