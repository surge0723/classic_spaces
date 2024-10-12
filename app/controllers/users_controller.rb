class UsersController < ApplicationController
 before_action :ensure_normal_user, only: :edit
 
  def show
    @user = User.find(params[:id])
    @space = Space.new
    @spaces = @user.spaces
    @spaces_list =current_user.spaces
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.where.not(email: 'guest@example.com') 
    @spaces = Space.all
    @space = Space.new
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your profile was successfully updated."
      redirect_to @user
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    flash[:notice] = '退会しました。ご利用ありがとうございました。'
    redirect_to :root
  end

  private
    def user_params
     params.require(:user).permit(:name, :email)
    end
    
   def ensure_normal_user
    if current_user.email == 'guest@example.com'
      flash[:alert] = "ゲストユーザーは、ユーザー情報を編集できません。"
      redirect_to user_path
    end
  end
end

