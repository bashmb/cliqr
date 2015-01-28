class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:create]
  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to @user
      sign_in @user
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.join(', ')
      redirect_to new_user_session_path
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

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
