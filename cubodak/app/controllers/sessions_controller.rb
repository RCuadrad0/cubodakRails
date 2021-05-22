class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        @user = User.find_by(username: params[:username])
        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            message = "Usuario o contraseña erronea"
            redirect_to auth_signin_path, notice: message
        end
    end

end
