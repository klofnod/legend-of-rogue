class GearSerializer < ActiveModel::Serializer
  attributes :id, :power, :name, :description, :effect
end
