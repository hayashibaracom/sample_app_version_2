class VideosController < ApplicationController
  def index
    @videos = Video.all
  end
  
  
  def new
    @user = User.find(current_user.id)
    @video = Video.new
    puts "<------------------------------------------------->"
    puts current_user.id
  end

  def create
    @video = Video.new(video_params.merge(user_id: current_user.id))
    @video.save
    redirect_to @video
  end

  def show
    @user = User.find(current_user.id)
    @video = Video.find(params[:id])
    puts "<--------------------------------------------------->"

  end

  private

  def video_params
    params.require(:video).permit(:title, :introduction, :user_id, :video)
  end
end

