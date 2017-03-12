class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = current_user.comments.build(micropost_id: @micropost.id)
    if @comment.update(comment_params)
      redirect_to @micropost
    else
      @comments = Comment.where(micropost_id: @micropost.id).order(created_at: :desc)
      render 'microposts/show'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:text, :image, :image_cache)
  end
end
