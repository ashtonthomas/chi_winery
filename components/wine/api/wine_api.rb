module WineComponentImpl
  class WineApi < Grape::API

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
