class CurrentRoundsController < ApplicationController


    def create
        round = CurrentRound.create(character_id: params[:character_id], game_id: params[:game_id], encounter_id: rand(1..5))
        round.game.set_round_on_start
        enemies = round.game.select_enemy
        render json: [round, enemies]
    end

    def nextTurn

        bad_guy = Enemy.find(params[:enemy_id])
        character = Character.find(params[:character_id])
        character.health_change(bad_guy)
        loot = Chest.create(gear_id:rand(1..10), character_id:params[:character_id], rarity:"normal")
        loot.stat_increase(character)
        round = CurrentRound.create(character_id: params[:character_id], game_id: params[:game_id], encounter_id: rand(1..5))
        round.game.round_increment
        enemies = round.game.select_enemy
        
        
        render json: [round, enemies, loot]
    end
end
