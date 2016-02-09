module WineComponentImpl
  class WineApi < Grape::API
    include Mondavi::Api

    # TODO
    # If we want to dynamically generate the ApplicationApi,
    # We need to have the url prefix defined here

    url_prefix '/wine/wines'

    # The available methods on a resource
    # _should_ be fairly standard in terms of HTTP Verbs / REST
    # However, we have flexibility if not and we
    # _shouldn't_ make too many hard assumptions around this

    resource :foo do
      desc 'Return a Hello World message'
      get do
        "foo!"
      end
    end

    route_param :id do
      desc 'Just get it. Test overriding this during specs'
      get do
        wine = Wine.find(params[:id])
        wine.extend(WineRepresenter)
      end
    end

  end
end
