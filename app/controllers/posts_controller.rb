class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
   @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    flash[:notice] = "Post successfully added!"
      redirect_to  posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post= Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated!"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post successfully removed!"
      redirect_to posts_path
    end
  end

private
  def post_params
    # Use strict parameters, replace placeholder info below with your class' actual attributes
    params.require(:post).permit(:content, :image, :user_id)
  end
end
