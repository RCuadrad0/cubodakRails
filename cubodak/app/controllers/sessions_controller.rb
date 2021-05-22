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

end
