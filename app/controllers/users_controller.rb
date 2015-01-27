class UsersController < ApplicationController
  def create
  end

  def destroy
  end

  def edit
  end

  def index
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end
end
