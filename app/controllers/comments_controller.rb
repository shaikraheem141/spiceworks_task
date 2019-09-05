class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end
  
  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: request.referer)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :question_id)
  end

  def find_commentable
    @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
    @commentable = Question.find(params[:question_id]) if params[:question_id]
  end
end
