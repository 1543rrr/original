class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  # def show
    # @post = Post.find(params[:id])
  # end

  def new
    @post = Post.new
  end

  def create 
    # binding.pry
    @post = Post.new(post_params)
    @post.user_id= 1
    if @post.save
      redirect_to root_path
    else  
    render :new
    end
  end  

  def edit
  end

  def update
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
