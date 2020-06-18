class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :home]

  def index
    #@posts = User.find(params[:user_id]).posts
    #@posts = current_user.posts
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # @user = User.find(params[:user_id])
    @post = Post.new
  end


  def create

    @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to posts_path, notice: 'Post was successfully created.'
      else
        render :new
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end



  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :user_id, :image_url, :description, :post_picture)
  end

end
