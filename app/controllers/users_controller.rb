 class UsersController < ApplicationController
 def new
  @user = User.new
 end

 def create 
  if (user_params[:name] == ''  || user_params[:password] == '' || user_params[:password_confirm] == '' || user_params[:key] == '')
    render html: "<h1><strong>您输入的信息不完全</strong></h1>".html_safe
    
  elsif (user_params[:password] != user_params[:password_confirm]) 
  render html: "<h1><strong>两次输入的密码不相同</strong></h1>".html_safe
 elsif 
  user = User.find_by(name: user_params[:name])
   # render json: {register:'Alread_exits_name'}
   render html: "<h1><strong>该用户名已经存在</strong></h1>".html_safe
  
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

