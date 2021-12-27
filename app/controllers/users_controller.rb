class UsersController < ApplicationController
  # サインインしている場合のみアクセス許可
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(8).reverse_order
  end

  def bookmark
    @user = current_user
    # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:post_id)
    # postsテーブルから、お気に入り登録済みのレコードを取得
    @bookmark_list = Bookmark.find(bookmarks)
  end

end
