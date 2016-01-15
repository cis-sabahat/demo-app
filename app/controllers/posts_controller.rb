class PostsController < ApplicationController

  def index
    @post = Post.all.order('created_at DESC')
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create(post_params)
    @post.user = current_user
    debugger 
    if @post.save
      render :json => {
        :status => :redirect,
        :to => post_path(@post.id)
      }.to_json
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:title,:description,:user_id,:avatar)
  end
end
