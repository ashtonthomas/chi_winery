module WinePact
  module WinesPact
    include PactBuilder

    pact_for WineApi::Wines

    pact :get, "{:id=>1}", Hashie::Mash.new(
      representer: WineRepresenter,
      response: {
        name: "Some Robert Mondavi Classic",
        vintage: 1966
      }
    )

  end
end
