class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:comment][:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @post
  end

  private 

  def comment_params
  	params.require(:comment).permit(:content, :post_id)
  end
end
