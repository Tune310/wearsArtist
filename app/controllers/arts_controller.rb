class ArtsController < ApplicationController
  def index
    @arts = Art.all
  end
  def user_arts
    @arts = current_user.arts
  end
  def new
    @art = Art.new
  end

  def show
  end

  def create
    @art = current_user.arts.new(art_params)
    if @art.save
      redirect_to user_arts_path(current_user.id)
    else
      redirect_to root_path
    end
  end
  private
  def art_params
    params.require(:art).permit(:title, :description, :avatar, :image_url)
  end
end
