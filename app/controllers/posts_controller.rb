class PostsController < ApplicationController
  def index
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to posts_path
    else
      flash[:error_messages] = post.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
