class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:create]

  before_action :set_user,
                only: [
                  :show,
                  :edit,
                  :update,
                  :destroy
                ]
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
    @user.destroy
    redirect_to root_path
  end

  def edit

  end

  def index

  end

  def new
    # default new form is not used, this redirects to the
    # corrrect sign-in form
    redirect_to new_user_session_path
  end

  def show

  end

  def update
    @user.update(user_params)
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_users
    @users = User.find(current_user.id)
  end
end
