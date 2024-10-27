class Admin::DashboardsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    def index
        @users = User.all
    end
    
    def show
    @user = User.find(params[:id])
    @spaces_list = @user.spaces
    @spaces_comment = @user.comments.includes(:space) 
    end
    
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to admin_dashboards_path, notice: 'コメントが削除されました。'
    end
end
