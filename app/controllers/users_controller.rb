class UsersController < ApplicationController
  before_filter :get_id_from_current_user
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_with(@users)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    respond_with(@user)
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    respond_with(@user)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.save
    respond_with(@user)
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with(@user)
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_with(@user)
  end
  
  private
  
  def get_id_from_current_user
    params[:id] = current_user.id unless params.has_key? :id
  end
end
