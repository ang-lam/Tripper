class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.user #log user in
            redirect_to root_path
        else
            #show errors
            #render signup form again
            render :new
        end
    end
end
