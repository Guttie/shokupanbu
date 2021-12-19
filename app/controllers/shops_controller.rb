class ShopsController < ApplicationController
  # サインインしている場合のみアクセス許可
  before_action :authenticate_user!

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    @shop.save
    redirect_to shop_path(@shop.id)
  end

  def show
    @shop = Shop.find(params[:id])
  end
  
  def edit
    @shop = Shop.find(params[:id])
    if @shop.user_id = current_user.id
      render :edit
    else
      redirect_to shops_path
    end
  end
  
  def update
    @shop = Shop.find(params[:id])
    @shop.user_id = current_user.id
    if @shop.update(shop_params)
      redirect_to shop_path(@shop.id)
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end

  # 投稿のストロングパラメータ
  private

  def shop_params
    params.require(:shop).permit(:image, :name, :review, shop_images_images: [])
  end
end
