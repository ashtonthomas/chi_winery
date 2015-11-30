require 'roar/representer/json'

module WineRepresenter #< Napa::Representer
  include Roar::Representer::JSON

  # TODO
  # include Grape::Roar::Representer

  property :id, type: String
  property :name, type: String
  property :vintage, type: Integer
end