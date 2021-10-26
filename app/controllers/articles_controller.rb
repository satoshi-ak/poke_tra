class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_article, only: %i[ show edit update destroy ]
  
  # GET /articles or /articles.json
  def index
    @articles = Article.all
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
    @articles = @articles.page(params[:page]).per(3)
  end

  # GET /articles/1 or /articles/1.json
  def show
    @favorite = current_user.favorites.find_by(article_id: @article.id)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.articles.build(article_params)
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "記事を作成しました！" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "記事を更新しました！" }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "記事を削除しました！" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :image, :user_id, :image_cache, :image, :country, :address, :latitude, :longitude)
    end
end
