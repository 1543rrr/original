class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :asc)
  end

  def show
    @post = Post.find(params[:id])
    @post.user_id= 1
  end

  def new
    @post = Post.new
  end

  def create 
    # binding.pry
    @post = Post.new(post_params)
    @post.user_id= 1
    if @post.save
      redirect_to root_path, notice: "投稿しました"
    else  
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end  

  def edit
    @post = Post.find(6)
  end
  
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
