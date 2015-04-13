class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @idea        = Idea.find params[:idea_id]
    @comment          = Comment.new(comment_params)
    @comment.user     = current_user
    @comment.idea = @idea
    if @comment.save
      redirect_to idea_path(@idea), 
                    notice: "Comment created!"
    else
      render "ideas/show"
    end
  end

  def destroy
    @idea = Idea.find params[:idea_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to idea_path(@idea), 
                  notice: "Comment deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
