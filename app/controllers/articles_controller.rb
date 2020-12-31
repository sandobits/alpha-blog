class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.where(is_deleted: false || nil)
  end

  def show
  end

  def new
    @article = Article.new()
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save then
      flash[:notice] = "Article was created successfully!"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params) then
      flash[:notice] = "Article was updated successfully!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.update(is_deleted: true, deleted_at: DateTime.now) then
      flash[:notice] = "Article was deleted!"
      redirect_to articles_path
    else
      flash[:notice] = "Unable to delete article!"
      redirect_to articles_path
    end
  end

  private 
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end