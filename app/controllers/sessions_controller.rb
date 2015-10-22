class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      log_in_user!(user)
      redirect_to user_url(user.id)
    else
      render text: "Login unsuccessful!"
    end
    # user.reset_session_token!
    # session[:session_token] = nil
  end
  def destroy
    log_out!
    redirect_to new_session_url
  end
end
