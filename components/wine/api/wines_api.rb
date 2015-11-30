module WineComponent
  class WinesApi < Grape::API

    resource :hello do
      desc 'Return a Hello World message'
      get do
        wine_maker = WineMaker.new(name: "RedBlueGreen", vintage: 2015)
        { message: wine_maker.call }
      end
    end

    desc 'just get it'
    get do
      # represent Wine.all.first, with: WineRepresenter
      # include Grape::Roar::Representer
      wine = Wine.all.first
      wine.extend(WineRepresenter)
      wine
    end

  end
end
