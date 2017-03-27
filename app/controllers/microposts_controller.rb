class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :show]

  def show
    @micropost = Micropost.find(params[:id])
    @comments = Comment.where(micropost_id: @micropost.id).order(created_at: :desc)
    @comment = current_user.comments.build
  end

  def index
    @micropost = current_user.microposts.build
    microposts = Micropost.all.order(created_at: :desc)
    @q        = microposts.search(params[:q])
    @microposts = @q.result(distinct: true)
    render 'static_pages/home'
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @micropost = current_user.microposts.build
      microposts = Micropost.all.order(created_at: :desc)
      @q        = microposts.search(params[:q])
      @microposts = @q.result(distinct: true)
      flash.now[:danger] = "投稿に失敗しました"
      render 'static_pages/home'
    end
  end
  
  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to root_url
  end

  
  private
  def micropost_params
    params.require(:micropost).permit(:content, :genre, :image1, :image2, :image3,
                                      :image1_cache, :image2_cache, :image3_cache,
                                      :give, :take)
  end
end