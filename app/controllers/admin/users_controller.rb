class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def new
    @user = User.new
    respond_with :admin, @user
  end

  def create
    @user = User.new(params[:user])
    flash[:notice] = "User has been created successfully" if @user.save
    respond_with :admin, @user
  end

  def index
    @users = User.all
    respond_with :admin, @users
  end

  def show
    @user = User.find(params[:id])
    respond_with :admin, @user
  end

  def edit
    @user = User.find(params[:id])
    respond_with :admin, @user
  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = "User has been updated successfully" if @user.update_attributes(params[:user])
    respond_with :admin, @user
  end

  def destroy
    @user = User.find(params[:id])
    flash[:notice] = "User has been destroyed successfully" if @user.destroy
    respond_with :admin, @user
  end
end
