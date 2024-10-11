class UsersController < ApplicationController
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
    @users = User.where.not(email: 'guest@example.com')          # 全てのユーザー
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
  
  
  private
    def user_params
     params.require(:user).permit(:name, :email)
    end
  end

