class PostsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id= 1
    if @post.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to posts_path
    else
      flash[:error_messages] = post.errors.full_messages
      render :new
    end
  end

 
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end
  

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    # @post.update(post_path)
    if @post.save
      redirect_to post_path(@post.id)
    else
      flash[:error_messages] = @post.errors.full_messages
      flash[:post] = @post
      redirect_to edit_post_path
    end
  end

  private

    def post_params
      params.require(:post).permit(:content, :title, :post_image, :user_id)
    end
end


