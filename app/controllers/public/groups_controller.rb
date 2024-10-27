class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def index
    @space = Space.new
    @groups = Group.all
  end

  def show
    @space=Space.new
    @group=Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id]) 
  end
  
  def update
    @group=Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice]="グループ情報を上書きしました！"
      redirect_to @group
    else
      flash[:alert] = "編集に失敗しました。必須項目を入力してください。" 
      render:edit
    end
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name,:introduction) # ここで許可する属性を指定
  end
  
  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end

end    
