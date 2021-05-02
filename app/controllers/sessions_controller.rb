class SessionsController < ApplicationController
  def new #login form
    redirect_if_logged_in
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      #display errors with flash? cannot use #errors
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
