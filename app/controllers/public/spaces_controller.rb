class Public::SpacesController < ApplicationController
   before_action :ensure_normal_user, only: :create
   
  def new
    @space=Space.new
  end
  
  def create
  @space = Space.new(space_params)
  @space.user = current_user # 投稿したユーザーを設定

  if @space.save
    flash[:notice] = "投稿を保存しました"
     redirect_to @space, notice: '投稿を保存しました'
  else
    flash[:alert] = "投稿できませんでした。必須項目を入力してください。" 
    render :new
  end
end

  def index
    @spaces = Space.page(params[:page])
    @space = Space.new
    @user = current_user
  end

  def show
    @space = Space.find_by(id: params[:id])
    if @space.nil?
      flash[:alert] = "指定された投稿は存在しません"
      redirect_to spaces_path
    else
    @space_new= Space.new
    @user = @space.user
    @comment = Comment.new
    end
  end
  

  def edit
    @space=Space.find_by(id:params[:id])
      if @space.nil?
        redirect_to spaces_path, alert: '投稿が見つかりません。' # エラーメッセージと共にリダイレクト
      elsif @space.user_id != current_user.id
          redirect_to spaces_path, alert: '他ユーザーの編集はできません。'
      else
        space=Space.find(params[:id])
      end
  end
  
  def update
    @space=Space.find(params[:id])
    if @space.update(space_params)
      flash[:notice]="会場情報を上書きしました！"
      redirect_to @space
    else
      flash[:alert] = "投稿に失敗しました。必須項目を入力してください。" 
      render:edit
    end
  end
  
  def destroy
    space=Space.find(params[:id])
    space.destroy
    redirect_to  user_path(current_user), notice: '投稿を削除しました。'
  end
  
  private
  def space_params
    params.require(:space).permit(:space, :place, :facility, :price, :payment, :category, :other)
  end
  
  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      flash[:alert] = "ゲストユーザーは、新規投稿ができません。"
      redirect_to spaces_path
    end
  end

end