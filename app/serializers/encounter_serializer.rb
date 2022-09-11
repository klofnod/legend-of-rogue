class EncounterSerializer < ActiveModel::Serializer
  attributes :id, :name, :setting, :plot, :enemy, :selected_enemy


  def selected_enemy
    Enemy.find(object.enemy)
  end
end
