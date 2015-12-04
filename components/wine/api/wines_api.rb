module WineComponent
  class WinesApi < Grape::API

    # resource :hello do
    #   desc 'Return a Hello World message'
    #   get do
    #     wine_maker = WineMaker.new(name: "RedBlueGreen", vintage: 2015)
    #     { message: wine_maker.call }
    #   end
    # end

    route_param :id do
      desc 'Just get it. Test overriding this during specs'
      get do
        wine = Wine.find(params[:id])
        wine.extend(WineRepresenter)
      end
    end
  end
end
