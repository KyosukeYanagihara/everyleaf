class UsersController < ApplicationController
  before_action :set_user, only: %i{ show edit update }
  skip_before_action :login_required, only: %i{ new create }
  def new
    if logged_in?
      redirect_to tasks_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    if current_user.id == @user.id
      render :show
    else
      redirect_to tasks_path, notice: "権限がありません。"
    end
  end

  def edit
    if current_user.id == @user_id
      render :edit
    else
      redirect_to tasks_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "編集しました"
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
