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
      
      transition_middle = list_of_abaddon_encounters.find_by(setting:'transitionMiddle').id
      transition_late = list_of_abaddon_encounters.find_by(setting:'transitionLate').id
      transition_boss = list_of_abaddon_encounters.find_by(setting:'transitionBoss').id
      boss = list_of_abaddon_encounters.find_by(setting:'boss').id
      case game.round
      when 1..3
        last_index = early_game.length - 1
        num = rand(0..last_index)
        update(encounter_id:early_game[num].id)
      when 4
        update(encounter_id:transition_middle)
      when 5..7
        last_index = mid_game.length - 1
        num = rand(0..last_index)
        update(encounter_id:mid_game[num].id)
      when 8
        update(encounter_id:transition_late)
      when 9..10
        last_index = late_game.length - 1
        num = rand(0..last_index)
        update(encounter_id:late_game[num].id)
      when 11
        update(encounter_id:transition_boss)
      when 12
        update(encounter_id:boss)
      else
        update(encounter_id:rand(1..8))


      end
    end

  end
end
