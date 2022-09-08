class SessionsController < ApplicationController
  def create
    user = Combatant.find_by( username: params[:username] )

    if user  
      if user.authenticate( params[:password] )
          session[:user_id] = user.id
           
          render json: user
      else 
          render json: { error: "** Check Your Password **" }
      end
    else
      render json: { error: "Username OR Password Don't Match" }
    end
end

  def destroy
    session.delete( :user_id )
    render json: {}
  end

  def logged_in_user
    user_logged = Combatant.find_by( id: session[:user_id] )
    render json: user_logged      
  end


end
