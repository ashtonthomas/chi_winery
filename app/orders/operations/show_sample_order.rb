module OrdersComponent
  class ShowSampleOrder

    def initialize(name: 'sample', quantity: 0)
      @name = name
      @quantity = quantity
      change_stuff
    end

    def call
      "Here is #{@name} order for a quantity of #{@quantity}"
    end

    private

    def change_stuff
      @name = "Cool #{@name}"
    end

  end
end
