class WinesApi < Grape::API

  resource :hello do
    desc 'Return a Hello World message'
    get do
      wine_maker = WineMaker.new(name: "RedBlueGreen", vintage: 2015)
      { message: wine_maker.call }
    end
  end

end
