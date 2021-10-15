class UsersController < ApplicationController
  def show
    @user = current_user
  end
  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
