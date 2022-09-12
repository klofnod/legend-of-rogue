class CurrentRoundsController < ApplicationController


    def create
        round = CurrentRound.create(character_id: params[:character_id], game_id: params[:game_id], encounter_id: 1)

        enemy = round.game.select_enemy(round.encounter)

        round.encounter.update(enemy:enemy.id)
        round.game.set_round_on_start

        render json: round
    end

    def nextTurn
        previous_round = Encounter.find(params[:encounter_id]).enemy

        
        current_round = CurrentRound.create(character_id: params[:character_id], game_id: params[:game_id])
        current_round.character.health_change(Enemy.find(previous_round))
        current_round.game.round_increment
        current_round.encounter_logic
        enemy = current_round.game.select_enemy(current_round.encounter)
        
        
        loot = current_round.character.chest_spawn
        
        

        current_round.encounter.update(enemy:enemy.id)
        #loot = Chest.create(gear_id:rand(1..10), character_id:params[:character_id], rarity:"normal")
        #loot.stat_increase(character)
        #character.chest_spawn
        #character.health_change(enemy)

        render json: [current_round, loot]
    end

    def flee
        previous_round = Encounter.find(params[:encounter_id]).enemy
        round = CurrentRound.create(character_id: params[:character_id], game_id: params[:game_id], encounter_id: rand(1..5))
        enemy = round.game.select_enemy(round.encounter)

        round.character.flee_attempt(Enemy.find(previous_round))
        round.game.round_increment
    
        round.encounter.update(enemy:enemy.id)

        render json: round
    end
end
