class VideosController < ApplicationController
  def index
  end
  
  
  def new
    @user = User.find(current_user.id)
    @video = Video.new
  end

  def create
    @video = Video.new(video_params.merge(user_id: current_user.id))
    if @video.save
      flash[:info] = "動画投稿完了！"
      redirect_to @video
    else 
      render new_video_path
    end
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params.merge(user_id: current_user.id))
      flash[:success] = "更新完了"
      redirect_to @video
    else  
      render edit_video_path(@video)
    end
  end

  def show
    @user = User.find(current_user.id)
    @video = Video.find(params[:id])
  end

  def edit
    @video = Video.find(params[:id])
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:success] = "Videodeleted"
    redirect_to @video
  end
  

  private

  def video_params
    params.require(:video).permit(:title, :introduction, :user_id, :video)
  end
end

