class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :backstory, :health, :power, :defence, :last_round
  has_one :combatant


  def last_round
    if object.current_rounds.length >= 1 
      object.current_rounds.max{|a,b| b.id <=> a.id }.encounter
    else
    end


  end
end
