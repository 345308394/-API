 class UsersController < ApplicationController
 def new
  @user = User.new
 end

 def create
  if (user_params[:name] == ''  || user_params[:password] == '' || user_params[:password_confirm] == '' || user_params[:key] == '')
    render js: "alert('您输入的信息不完全');"
  elsif (user_params[:password] != user_params[:password_confirm])
  render js: "alert('两次输入的密码不相同');"
 elsif 
  user = User.find_by(name: user_params[:name])
   # render json: {register:'Alread_exits_name'}
   #render html: "<strong>该用户名已经存在</strong>".html_safe
    render js: "alert('该用户名已经存在');"
 elsif     
   @user = User.create(user_params)
   @user.save
   # render json: {register_success:'yes'}
   render js: "alert('注册成功');"
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

