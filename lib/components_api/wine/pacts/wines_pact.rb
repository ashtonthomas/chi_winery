# This is where we can define our pacts
# map parameters to return
# used in consumer and produce specs
module WinePact
  module WinesPact
    include PactBuilder

    pact_for WineApi::Wines

    # I also need to know which representer to use here
    # I don't think we need the verb
    # the verb really only matters when we have the same url
    # but we always have distinct method names
    pact :get, "{:id=>1}", Hashie::Mash.new(
      representer: WineRepresenter,
      response: {
        name: "Some Robert Mondavi Classic",
        vintage: 1966
      }
    )

  end
end
