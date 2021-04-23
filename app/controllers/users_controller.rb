class UsersController < ApplicationController

    def new
        if logged_in?
            redirect_to root_path
        end
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id #log user in
            redirect_to root_path
        else
            #show errors
            #render signup form again
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end