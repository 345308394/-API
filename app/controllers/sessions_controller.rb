class SessionsController < ApplicationController
 def new
 end
 
 def create

  user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
  if user

   render json: {login_success:'yes'}
  else
   render json: {login_success:'no'}
  end
 end
 def  obtain_page	
 end
 def obtain 	
   user = User.find_by(name: user_params[:name])
   keykey = user_params[:key]
  if (user.key == keykey) 
     
   render json: {obtain_success:'yes',mima:user.password_confirm }
  else
   render json: {obtain_success:'no'}
  end
 end
 
 private
  def user_params
   params.require(:session).permit(:name, :password, :key, :password_confirm)
  end
end