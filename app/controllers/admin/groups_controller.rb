  class Admin::GroupsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!  # 管理者のみアクセス可能にするためのDevise認証
    before_action :set_group, only: [:destroy]

    def index
      @groups = Group.all
    end

    def destroy
      @group.destroy
      flash[:notice] = "グループが削除されました。"
      redirect_to admin_groups_path
    end

    private

    def set_group
      @group = Group.find(params[:id])
    end
  end
