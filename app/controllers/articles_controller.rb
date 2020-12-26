class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new 
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save # will return false without error message if fields do not match validation
    redirect_to @article
  end
end