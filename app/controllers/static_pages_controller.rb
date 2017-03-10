class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      microposts = Micropost.where(original_micropost_id: nil, original_user_id: nil).order(created_at: :desc)
      @q        = microposts.search(params[:q])
      @microposts = @q.result(distinct: true)
    end
  end
end