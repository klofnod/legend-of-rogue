class Character < ApplicationRecord
  belongs_to :combatant
  has_many :current_rounds
  has_many :games, through: :current_rounds
  has_many :chests
  has_many :gears, through: :chests


  def health_change(enemy)

    percent =  (defence/100.to_f) * enemy.power
    incoming_damage = enemy.power - percent
    health_change = health - incoming_damage
    update(health: health_change)

    bad_health = enemy.health
    enemy_defence = (enemy.defence/100.to_f) * power
    damage_dealt = power - enemy_defence
    while  bad_health - damage_dealt > 0
      bad_health = bad_health - power
      percent =  (defence/100.to_f) * enemy.power
      incoming_damage = enemy.power - percent
      health_change = health - incoming_damage
      update(health: health_change)


    end
  end


end
