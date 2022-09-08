class ChestSerializer < ActiveModel::Serializer
  attributes :id, :rarity
  has_one :gear
  has_one :character
end
