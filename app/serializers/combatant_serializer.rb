class CombatantSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :characters
end
