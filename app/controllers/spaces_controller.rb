class SpacesController < ApplicationController
   before_action :ensure_normal_user, only: :new
  def new
    @space=Space.new
  end
  
  def create
  @space = Space.new(space_params)
  @space.user = current_user # 投稿したユーザーを設定

  if @space.save
    flash[:notice] = "投稿を上書き保存しました"
     redirect_to @space, notice: '投稿を上書き保存しました'
  else
    flash[:alert] = "投稿に失敗しました。必須項目を入力してください。" 
    render :new
  end
end

  def index
    @spaces = Space.all
    @space = Space.new
    @user = current_user
  end

  def show
    @space = Space.find(params[:id])
    @space_new=Space.new
    @user = @space.user

  end

  def edit
    @space=Space.find(params[:id])
  end
  
  def update
    @space=Space.find(params[:id])
    if @space.update(space_params)
      flash[:otice]="会場情報を上書きしました！"
      redirect_to @space
    else
      render:edit
    end
  end
  
  def destroy
    space=Space.find(params[:id])
    space.destroy
    redirect_to spaces_path
  end
  
  private
  def space_params
    params.require(:space).permit(:space, :place, :facility, :price, :payment, :category, :other)
  end
  
  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      flash[:notice] = "ゲストユーザーは、新規投稿ができません。"
      redirect_to spaces_path
    end
  end

end
