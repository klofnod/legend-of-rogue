class CurrentRoundSerializer < ActiveModel::Serializer
  attributes :id
  has_one :character
  has_one :game
  has_one :encounter
end
