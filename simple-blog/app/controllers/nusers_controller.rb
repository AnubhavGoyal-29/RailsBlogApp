class NusersController < ApplicationController

    def new
    end

    def create
      user= Nuser.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to root_path
      else 
        redirect_to '/nusers/signup'
      end
    end
    private
    def user_params
      params.require(:nuser).permit(:name, :email, :password, :password_confirmation)
    end
end
