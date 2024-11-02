class Public::CommentsController < ApplicationController
  def create
    space = Space.find(params[:space_id])
    comment = current_user.comments.new(comment_params)
    comment.space_id = space.id
    if comment.save
      flash[:notice] = "投稿を保存しました"
      redirect_to request.referer
    else
      @error_messages = comment.errors.full_messages
      Rails.logger.debug "エラーメッセージ: #{@error_messages.join(", ")}"
      respond_to do |format|
        format.html { redirect_to request.referer }
        format.js   # JSリクエストの場合は、モーダルを表示するJSを実行
      end
    end
  end

  def destroy
    Comment.find_by(id: params[:id], space_id: params[:space_id]).destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :category) 
  end
end
