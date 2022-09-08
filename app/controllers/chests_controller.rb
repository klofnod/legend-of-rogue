class ChestsController < ApplicationController

    def create
        loot = Chest.create(gear_id:rand(1..10), character_id:params[:character_id], rarity:"normal")
        loot.stat_increase(Character.find(params[:character_id]))
 
        render json: loot
        
    end
end
