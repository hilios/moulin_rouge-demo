class PostsController < ApplicationController
  before_filter :build_comment

  skip_before_filter :authenticate_user!, :only => [:index, :show]
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = @search.result(distinct: true)
    @posts = @posts.approved if cannot? :manage, Post
    respond_with(@posts)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comments = @post.approved if cannot? :manage, Comment
    respond_with(@post)
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    respond_with(@post)
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    respond_with(@post)
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post], as: current_user.role.to_sym)
    @post.save
    respond_with(@post)
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post], as: current_user.role.to_sym)
    respond_with(@post)
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with(@post)
  end
  
  private
  
  def build_comment
    @comment = Comment.new
  end
end
