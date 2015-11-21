class WineRepresenter < Napa::Representer
  property :id, type: String
  property :name, type: String
  property :vintage, type: Integer
end