class UsersController < ApplicationController
  def new

  end
  def create
    user = User.new(user_params)
    user.save!
    redirect_to user_url(user.id)
  end
  def show
    @current_user = current_user
    render :show
  end
  def user_params
    self.params.require(:user).permit(:email, :password)
  end
end
