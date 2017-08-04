 class UsersController < ApplicationController
 def new
  @user = User.new
 end

 def create
  if (user_params[:name] == ''  || user_params[:password] == '' || user_params[:password_confirm] == '' || user_params[:key] == '')
    redirect_to '/users/registererror0'
  elsif (user_params[:password] != user_params[:password_confirm])
   redirect_to '/users/registererror1'
 elsif 
  user = User.find_by(name: user_params[:name])
   # render json: {register:'Alread_exits_name'}
   redirect_to '/users/registererror2'
 elsif     
   @user = User.create(user_params)
   @user.save
   # render json: {register_success:'yes'}
  
  end
end

def index
  @users = User.all
  end 
 private
  def user_params
   params.require(:user).permit(:name, :password, :password_confirm,:key)
  end
end

