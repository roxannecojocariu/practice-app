require 'pry'
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully submitted."
      redirect_to article_path(@article)
    else
      flash[:notice] = @article.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:subject, :body)
  end
end
