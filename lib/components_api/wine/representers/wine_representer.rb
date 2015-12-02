require 'roar/representer/json'
require 'roar/decorator'

module WineRepresenter #< Roar::Decorator
  include Roar::Representer::JSON

  # TODO
  # include Grape::Roar::Representer

  property :id, type: String
  property :name, type: String
  property :vintage, type: Integer
end
