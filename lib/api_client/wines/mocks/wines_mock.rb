module WinesApi
  class Wines
    def self.get(id: nil)
      wine = Wine.new
      wine.extend(WineRepresenter)
      wine.from_json(FactoryGirl.build(:wine).to_json)
    end
  end
end
