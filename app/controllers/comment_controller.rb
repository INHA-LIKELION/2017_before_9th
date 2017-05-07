class CommentController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(content: params[:content])
    @comment.save
    redirect_to '/post/' + @post.id.to_s + '/show'
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.content = params[:content]
    @comment.save
    redirect_to '/post/' + @post.id.to_s + '/show'
  end

  def destroy
    Comment.destroy(params[:id])
    redirect_to :back
  end
end
