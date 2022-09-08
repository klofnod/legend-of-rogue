class GameSerializer < ActiveModel::Serializer
  attributes :id, :round
  has_many :enemies
end
