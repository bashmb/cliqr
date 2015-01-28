class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
  end

  def edit
  end

  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  private

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
