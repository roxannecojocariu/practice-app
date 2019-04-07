require 'pry'
class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = @article
    @comments = @article.comments

    if @comment.save
      flash[:notice] = "Answer was successfully submitted."
      redirect_to article_path(@article)
    else
      flash[:notice] = @comment.errors.full_messages.join(", ")
      render 'articles/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end
end
