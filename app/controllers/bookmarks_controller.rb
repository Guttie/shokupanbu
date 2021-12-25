class BookmarksController < ApplicationController
  # サインインしている場合のみアクセス許可
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @bookmark = @post.bookmarks.new(user_id: current_user.id)
    if @bookmark.save
    else
      redirect_to request.referer
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @bookmark = @post.bookmarks.find_by(user_id: current_user.id)
    # ブックマーク済かどうか判断
    if @bookmark.present?
      @bookmark.destroy
    else
      redirect_to request.referer
    end
  end
end
