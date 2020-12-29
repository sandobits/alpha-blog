class ArticlesController < ApplicationController
  def index
    @articles = Article.where(is_deleted: false || nil)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new()
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save then # will return false without error message if fields do not match validation
      flash[:notice] = "Article was created successfully!"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description)) then
      flash[:notice] = "Article was updated successfully!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.update(is_deleted: true, deleted_at: DateTime.now) then
      flash[:notice] = "Article was deleted!"
      redirect_to articles_path
    else
      flash[:notice] = "Unable to delete article!"
      redirect_to articles_path
    end

  end
end