class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
  end

  def create
    @post = Post.new(title: params[:title], content: params[:content])
    @post.save
    redirect_to '/post/index'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect_to '/post/' + @post.id.to_s + '/show'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.destroy_all
    @post.destroy
    redirect_to '/post/index'
  end
end