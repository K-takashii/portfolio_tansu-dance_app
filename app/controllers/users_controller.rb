class UsersController < ApplicationController
   before_action :authenticate_user!
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    sign_in(user, bypass: true)
    redirect_to user_path(current_user)
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password
      )
  end
end
