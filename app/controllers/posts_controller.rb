class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user_id])
      @post = @user.posts.create(post_params)
      redirect_to posts_url
  end

  def show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to request.referrer || posts_url

  end

  def post_params
     params.require(:post).permit(:picture)
   end
end
