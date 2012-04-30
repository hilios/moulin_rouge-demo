class CommentsController < ApplicationController

  before_filter :load_post

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    respond_with(@post, @comment)
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    respond_with(@post, @comment)
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.save
    respond_with(@post, @comment)
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
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
