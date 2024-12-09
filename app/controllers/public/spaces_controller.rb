class Public::SpacesController < ApplicationController
  def destroy
    @space = Space.find(params[:id])
    @space.destroy
    redirect_to admin_dashboards_path, notice: 'スペースを削除しました。'
  end
end
