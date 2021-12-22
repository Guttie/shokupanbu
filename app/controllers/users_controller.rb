class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    shops = @user.shops
    toasts = @user.toasts
    sandwiches = @user.sandwiches
    # それぞれの複数インスタンスを1つの配列へ
    @overalls = shops | toasts | sandwiches
    # 作成降順に並び替え
    @overalls.sort!{ |a, b| b.created_at <=> a.created_at }
  end
end
