class CharactersController < ApplicationController

    
    def create
        user = Combatant.find_by(id: session[:user_id])
        if user
            params[:power] = rand(4..7)
            params[:health] = rand(20..22)
            params[:defence] = rand(15..18)
    
            Character.create(character_params) 
            render json: user.select_alive
        end
    end

    private

    def character_params
        params.permit(:name, :backstory, :combatant_id, :power, :health, :defence)
    end
end
