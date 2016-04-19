class UsersController < ApplicationController
  before_action :get_user, only:[:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def update
    if @user.update(user_parms)
      redirect_to @user
    else
      redirect_to edit_user_path(@user)
    end
  end

  def create
    @user = User.new(user_parms)
    if @user.save
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  private
    def get_user
      @user = User.find(params[:id])
    end

    def user_parms
      params.require(:user).permit([:username, :name, :last_name, :password])
    end
end
