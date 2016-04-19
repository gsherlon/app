class TweetsController < ApplicationController
  before_action :get_data, only:[:show, :edit, :update, :destroy, :index]

  def show
  end

  def edit
  end

  def index

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
    def get_data
      @user = User.find(params[:user_id])
      @tweets = @user.tweets
    end

    def user_parms
      params.require(:tweet).permit([:status])
    end
end
