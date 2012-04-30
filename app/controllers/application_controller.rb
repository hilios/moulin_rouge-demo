class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_user!
  before_filter :search_posts

  respond_to :html, :json

  def search_posts
    @search = Post.search(params[:q])
  end
end
