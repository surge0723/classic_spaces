class Public::GroupUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group_user, only: [:update_status]
  before_action :ensure_normal_user, only: [:create,:update_status]
  
  def create
    @group = Group.find(params[:group_id])
    @group_user = @group.group_users.find_or_initialize_by(user: current_user)
  
    if @group_user.persisted?
      # ユーザーがすでにグループに存在する場合、ステータスを pending に更新
      @group_user.update(status: :pending)
      redirect_to @group, notice: '再申請が送信されました。'
    else
      # ユーザーがグループに存在しない場合、新しいグループユーザーのレコードを作成
      @group_user.status = :pending
  
      if @group_user.save
        redirect_to @group, notice: '参加申請が送信されました。'
      else
        redirect_to @group, alert: '参加申請の送信に失敗しました。'
      end
    end
  end

  def update_status
    @group_user = GroupUser.find(params[:group_user_id])
    if @group_user.update(status: params[:status])  # 承認または拒否を更新
      redirect_to group_path(@group_user.group), notice: '申請が更新されました。'
    else
      redirect_to group_path(@group_user.group), alert: '申請の更新に失敗しました。'
    end
  end
  
  def destroy
    group_user = current_user.group_users.find_by(group_id: params[:group_id])
    
    if group_user
      group_user.update(status: :leave)
      redirect_to group_path(group_user.group), notice: 'グループから退会しました。'
    else
      redirect_to groups_path, alert: '退会できませんでした。'
    end
  end
  
  private

  def set_group_user
    @group_user = GroupUser.find(params[:group_user_id]) 
  end
  
  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      flash[:alert] = "ゲストユーザーは、グループ加入ができません。"
      redirect_to groups_path
    end
  end
end
