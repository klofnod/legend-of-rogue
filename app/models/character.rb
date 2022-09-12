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


    while  (bad_health - damage_dealt).round > 0

      bad_health = bad_health - damage_dealt
      percent =  (defence/100.to_f) * enemy.power
      incoming_damage = enemy.power - percent
      health_change = health - incoming_damage
      update(health: health_change)

    end
  end

  def flee_attempt(enemy)
    if  power > enemy.power
      diffrence = (power - enemy.power)/power.to_f*100
      if (rand(100)-diffrence > 0)
        percent =  (defence/100.to_f) * enemy.power
        incoming_damage = enemy.power - percent
        health_change = health - incoming_damage
        update(health: health_change)
      end

     elsif power < enemy.power
      diffrence = (enemy.power- (enemy.power - power))/enemy.power.to_f*100
      if(rand(100)-diffrence > 0)
        percent =  (defence/100.to_f) * enemy.power
        incoming_damage = enemy.power - percent
        health_change = health - incoming_damage
        update(health: health_change)
      end

    end
    
  end

  def chest_spawn
    byebug
    gear = Chest.create(gear_id:rand(1..10), character_id:self.id, rarity:"normal").gear
    num = gear.power
    if gear.effect == "damage"
      
      upnum = power + num
      update(power: upnum)
  elsif gear.effect == "health"
      
      uphealth = num + health
      update(health: uphealth)
  elsif gear.effect == "defence"
     
      updef = defence + num
      update(defence: updef)
  end
    gear
  end


end
