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

  def edit
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.find(params[:id])

    if @art.update(art_params)
      redirect_to user_arts_path, :notice => "Updated"
    else
      render "edit"
  end
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

  def destroy
    @art = Art.destroy
  end

  private
  def art_params
    params.require(:art).permit(:title, :description, :avatar, :image_url)
  end
end
