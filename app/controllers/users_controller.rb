class UsersController < ApplicationController
  before_action :set_user,only:[:show,:edit ,:update]
  def index
    @users = User.all
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).per(2)
  end

  def edit
    @user = User.find(params[:id])
    if @article.user == current_user
      render "edit"
    else
      redirect_to articles_path
    end  
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end
  def destroy
    @user.destroy
    rendirect_to user_path
  end
  private

  def user_params
    params.require(:user).permit(:id,:name, :email, :image, :profile)
  end
  def set_user
    @user = User.find(params[:id])
  end
end