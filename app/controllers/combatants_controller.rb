class CombatantsController < ApplicationController
    def show
        user = Combatant.find_by(id: session[:user_id])

        if user
          render json: user
        else
          render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    def create
        user = Combatant.create(user_params)
        if user.valid? 
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def alive
        characters = Combatant.find_by(id: session[:user_id]).select_alive
        render json: characters
    end

    def dead
      characters = Combatant.find_by(id: session[:user_id]).select_dead
      render json: characters
    end


    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
