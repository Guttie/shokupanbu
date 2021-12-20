class SandwichesController < ApplicationController
  # サインインしている場合のみアクセス許可
  before_action :authenticate_user!

  def index
    @sandwiches = Sandwich.all
  end

  def new
    @sandwich = Sandwich.new
  end

  def create
    @sandwich = Sandwich.new(sandwich_params)
    @sandwich.user_id = current_user.id
    @sandwich.save
    redirect_to sandwich_path(@sandwich.id)
  end

  def show
    @sandwich = Sandwich.find(params[:id])
  end

  def edit
    @sandwich = Sandwich.find(params[:id])
    if @sandwich.user_id = current_user.id
      render :edit
    else
      redirect_to sandwiches_path
    end
  end

  def update
    @sandwich = Sandwich.find(params[:id])
    @sandwich.user_id = current_user.id
    if @sandwich.update(sandwich_params)
      redirect_to sandwich_path(@sandwich.id)
    else
      render :edit
    end
  end

  def destroy
    @sandwich = Sandwich.find(params[:id])
    @sandwich.destroy
    redirect_to sandwiches_path
  end

  # 投稿のストロングパラメータ
  private

  def sandwich_params
    params.require(:sandwich).permit(:image, :name, :review, sandwich_images_images: [])
  end
end
