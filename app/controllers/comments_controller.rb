class CommentsController < ApplicationController

  before_filter :load_post
  skip_before_filter :authenticate_user!, :only => [:new, :create]

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.save
    respond_with(@post, @comment)
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_with(@post, @comment)
  end

  private

  def load_post
    @post = Post.find(params[:post_id])
  end
end
