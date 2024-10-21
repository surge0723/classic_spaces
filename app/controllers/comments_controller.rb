class CommentsController < ApplicationController
  def create
    space = Space.find(params[:space_id])
    comment = current_user.comments.new(space_comment_params)
    comment.space_id = space.id
    if comment.save
        flash[:notice] = "投稿を保存しました"
        redirect_to request.referer
    else
        flash[:alert] = "必須項目を入力してください。" 
        redirect_to request.referer
    end
  end

  def destroy
    Comment.find_by(id: params[:id], space_id: params[:space_id]).destroy
    redirect_to request.referer
  end

  private
  def space_comment_params
    params.require(:comment).permit(:comment,:category)
  end
end
