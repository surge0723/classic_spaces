class Public::SpacesController < ApplicationController
  before_action :ensure_normal_user, only: :create
  
  def destroy
    @space = Space.find(params[:id])
    @space.destroy
    redirect_to admin_dashboards_path, notice: 'スペースを削除しました。'
  end

  def new
    @space = Space.new
  end

  def create
  @space = Space.new(space_params)
    if @space.save
      flash[:notice] = "投稿を保存しました"
      redirect_to spaces_path
    else
      flash[:alert] = "投稿できませんでした。必須項目を入力してください。" 
      render 'new'
    end
  end
  
  def index
    @spaces = Space.all
  end

  private

  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      flash[:alert] = "ゲストユーザーは、新規投稿を行えません。"
      redirect_to spaces_path
    end
  end
end
