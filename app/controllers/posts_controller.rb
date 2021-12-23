class PostsController < ApplicationController
  # サインインしている場合のみアクセス許可
  before_action :authenticate_user!

  def shop
    @posts = Post.all
  end

  def toast
    @posts = Post.all
  end

  def sandwich
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id = current_user.id
      render :edit
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  # 投稿のストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:image, :name, :review, :category, post_images_images: [])
  end
end
