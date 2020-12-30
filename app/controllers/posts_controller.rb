class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id:"DESC")
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end

  def checked
    post = Post.find(params[:id])
    if post.cheked
      post.update(cheked: false)
    else
      post.update(cheked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end