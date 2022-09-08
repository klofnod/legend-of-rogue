class Chest < ApplicationRecord
  belongs_to :gear
  belongs_to :character


  def stat_increase(character)
    num = gear.power
    if gear.effect == "damage"
      power = character.power
      upnum = power + num
      character.update(power: upnum)
  elsif gear.effect == "health"
      health = character.health
      uphealth = num + health
      character.update(health: uphealth)
  elsif gear.effect == "defence"
      defence = character.defence
      updef = defence + num
      character.update(defence: updef)
  end
  end
end
