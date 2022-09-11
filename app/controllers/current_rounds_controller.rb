class CurrentRoundsController < ApplicationController


    def create
        round = CurrentRound.create(character_id: params[:character_id], game_id: params[:game_id], encounter_id: rand(1..5))
        enemy = round.game.select_enemy
        round.encounter.update(enemy:enemy.id)
        round.game.set_round_on_start

        render json: round
    end

    def nextTurn
        previous_round = Encounter.find(params[:encounter_id]).enemy
        
        round = CurrentRound.create(character_id: params[:character_id], game_id: params[:game_id], encounter_id: rand(1..5))
        enemy = round.game.select_enemy
        round.character.health_change(Enemy.find(previous_round))
        round.character.chest_spawn
        round.game.round_increment
        
        round.encounter.update(enemy:enemy.id)
        
        
        #loot = Chest.create(gear_id:rand(1..10), character_id:params[:character_id], rarity:"normal")
        #loot.stat_increase(character)
        #character.chest_spawn
        #character.health_change(enemy)
        
        
        
        
        render json: round
    end
end
