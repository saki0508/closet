class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/posts/#{comment.post.id}"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.post
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
