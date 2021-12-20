class ToastsController < ApplicationController
  # サインインしている場合のみアクセス許可
  before_action :authenticate_user!

  def index
    @toasts = Toast.all
  end

  def new
    @toast = Toast.new
  end

  def create
    @toast = Toast.new(toast_params)
    @toast.user_id = current_user.id
    @toast.save
    redirect_to toast_path(@toast.id)
  end

  def show
    @toast = Toast.find(params[:id])
  end
  
  def edit
    @toast = Toast.find(params[:id])
    if @toast.user_id = current_user.id
      render :edit
    else
      redirect_to toasts_path
    end
  end
  
  def update
    @toast = Toast.find(params[:id])
    @toast.user_id = current_user.id
    if @toast.update(toast_params)
      redirect_to toast_path(@toast.id)
    else
      render :edit
    end
  end

  def destroy
    @toast = Toast.find(params[:id])
    @toast.destroy
    redirect_to toasts_path
  end

  # 投稿のストロングパラメータ
  private

  def toast_params
    params.require(:toast).permit(:image, :name, :review, toast_images_images: [])
  end
end
