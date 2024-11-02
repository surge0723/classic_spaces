class Public::FavoritesController < ApplicationController
  before_action :ensure_normal_user, only: :create
  
  def create
    space = Space.find(params[:space_id])
    favorite = current_user.favorites.new(space_id: space.id)
    favorite.save
    redirect_to request.referer
  end

  def index
    @space = Space.find(params[:space_id])
    @favorites = current_user.favorites.includes(:space)
  end
  
  def destroy
    space = Space.find(params[:space_id])
    favorite = current_user.favorites.find_by(space_id: space.id)
    favorite.destroy
    redirect_to request.referer
  end
  
  private
    def ensure_normal_user
      if current_user.email == 'guest@example.com'
        flash[:alert] = "ゲストユーザーは、投稿の保存ができません。"
        redirect_to spaces_path
      end
    end
end
