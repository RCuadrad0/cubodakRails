class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        @user = User.find_by(username: params[:username])
        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            render json: {"msg": "Bienvenid- %s" %[@user.name], "status":200}
        else
            message = "Usuario o contraseña erronea"
            render json: {"msg": message}
        end
    end
    def GoogleAuth
        user_info = request.env["omniauth.auth"]
        user =  User.find_by_email(user_info["info"]["email"])
        if user
            session[:user_id] = user.id
            redirect_to root_path
            return
        end
        user           = User.new
        user.id        = user_info["uid"]
        user.name      = user_info["info"]["name"]
        user.email     = user_info["info"]["email"]
        user.image = user_info["info"]["image"]
        session[:user_id] = user.id
        redirect_to root_path
    end

end
