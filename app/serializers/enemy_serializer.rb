class EnemySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :health, :power, :defence
  has_one :game
end
