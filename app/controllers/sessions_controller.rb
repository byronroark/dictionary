class SessionsController < ApplicationController

  def new
  end

  def destroy
    reset_session

    redirect_to new_session_path
  end

  def create
    email    = params[:email]
    password = params[:password]

    user = User.find_by(email: email)
    if user && password == user.password
      session[:user_id] = user.id
      redirect_to root_path
    else
      # unknown user
      # set some notices to help the user
      #  "Unknown user or invalid password"
      redirect_to new_session_path
    end
  end
end
