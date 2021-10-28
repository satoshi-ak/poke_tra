class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.all
  end
  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])
    redirect_to articles_path, notice: "#{favorite.article.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(article_id: params[:id]).destroy
    redirect_to articles_path, notice: "#{favorite.article.user.name}さんのブログをお気に入り解除しました"
  end
end
