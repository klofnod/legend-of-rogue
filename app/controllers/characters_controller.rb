class CharactersController < ApplicationController

    
    def create
        user = Combatant.find_by(id: session[:user_id])
        if user
            params[:power] = rand(3..5)
            params[:health] = rand(5..9)
            params[:defence] = rand(1..3)
    
            Character.create(character_params) 
            render json: user.select_alive
        end
    end

    private

    def character_params
        params.permit(:name, :backstory, :combatant_id, :power, :health, :defence)
    end
end
