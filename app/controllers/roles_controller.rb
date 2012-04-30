class RolesController < ApplicationController
  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all
    respond_with(@roles)
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = Role.find(params[:id])
    respond_with(@role)
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @role = Role.new
    respond_with(@role)
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
    respond_with(@role)
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(params[:role])
    @role.save
    respond_with(@role)
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @role = Role.find(params[:id])
    @role.update_attributes(params[:role])
    respond_with(@role)
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    respond_with(@role)
  end
end
