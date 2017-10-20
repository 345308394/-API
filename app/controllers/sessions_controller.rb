class SessionsController < ApplicationController
 def new
 end
 
 def create1
  
  name =params[:name]
  password_confirm = params[:password_confirm]
  user = User.find_by(name: name )
  

  if (user.password_confirm == password_confirm)

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
     
    # redirect_to '/sessions/obtainsuccess'
     
    render json: {密码:user.password_confirm }
  elsif (user.name)
     render html: "<h1><strong>您的取密钥匙不正确</strong></h1>".html_safe
   # render json: {obtain_success:'no'}
  
  end
 end
 
 private
  def user_params
   params.require(:session).permit(:name, :password, :key, :password_confirm)
  end
end