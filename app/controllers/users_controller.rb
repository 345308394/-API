 class UsersController < ApplicationController
 def new
  @user = User.new
 end

 def create
  
  if
   user = User.find_by(name: user_params[:name])
   render json: {register:'Alread_exits_name'}
  else
   @user = User.create(user_params)
   @user.save
   render json: {register_success:'yes'}
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

