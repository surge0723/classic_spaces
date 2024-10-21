class Public::FavoritesController < ApplicationController
  def create
    space = Space.find(params[:space_id])
    favorite = current_user.favorites.new(space_id: space.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    space = Space.find(params[:space_id])
    favorite = current_user.favorites.find_by(space_id: space.id)
    favorite.destroy
    redirect_to request.referer
  end
end
