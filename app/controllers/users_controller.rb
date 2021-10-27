class UsersController < ApplicationController
  
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
