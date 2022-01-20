class PostsController < ApplicationController
  # サインインしている場合のみアクセス許可
  before_action :authenticate_user!

  def shop
    @posts = Post.where(category: 'shop').page(params[:page]).per(9)
  end

  def toast
    @posts = Post.where(category: 'toast').page(params[:page]).per(9)
  end

  def sandwich
    @posts = Post.where(category: 'sandwich').page(params[:page]).per(9)
  end

  def search
    # @search = Post.ransack(params[:q])
    # @posts = @search.result.order(created_at: :desc).page(params[:page]).per(10)

    @keywords = params[:keywords].split(/[[:blank:]]+/)
    
    @posts = Post.none

    unless params[:keywords].blank?
      enum_search = Post.categories_i18n.index(params[:keywords])
      category = Post.categories[enum_search.to_sym] unless enum_search.nil?

      @keywords.each do |keyword|
        @posts = @posts.or(Post.search(keyword, category))
      end

      @posts = @posts.order(created_at: :desc)
                      .page(params[:page])
                      .per(10)
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id), notice: "投稿が成功しました。"
    else
      render :new
    end
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
      redirect_to post_path(@post.id), notice: "編集が成功しました。"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    p @post

    case @post.category
      when 'shop' then
        redirect_to shop_path
      when 'toast' then
        redirect_to toast_path
      when 'sandwich' then
        redirect_to sandwich_path
      else
        redirect_to root_path
    end
  end

  # 投稿のストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:image, :name, :review, :category, post_images_images: [])
  end
end
