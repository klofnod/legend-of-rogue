class CurrentRound < ApplicationRecord
  belongs_to :character
  belongs_to :game
  belongs_to :encounter



  def encounter_logic
    case game.id
    when 1
      list_of_abaddon_encounters = Encounter.where(name:'Abaddon')
      early_game = list_of_abaddon_encounters.select{|each|each.setting=='early'}
      mid_game = list_of_abaddon_encounters.select{|each|each.setting=='middle'}
      late_game = list_of_abaddon_encounters.select{|each|each.setting=='late'}
      boss = list_of_abaddon_encounters.find_by(setting:'boss').id
      case game.round
      when 1..4
        last_index = early_game.length - 1
        num = rand(0..last_index)
        update(encounter_id:early_game[num].id)
      when 5..8
        last_index = mid_game.length - 1
        num = rand(0..last_index)
        update(encounter_id:mid_game[num].id)
      when 9..11
        last_index = late_game.length - 1
        num = rand(0..last_index)
        update(encounter_id:late_game[num].id)
      when 12
        update(encounter_id:boss)
      else
        update(encounter_id:13)
      end
    end

  end
end
