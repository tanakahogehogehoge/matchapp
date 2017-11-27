class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    if user_signed_in?
      @comment = current_user.comments.build(comment_params)
    elsif owner_signed_in?
      @comment = current_owner.comments.build(comment_params)
    end
    @event = @comment.event
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to event_path(@event), notice: 'コメントを投稿しました。' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:event_id, :store_info)
    end
end
