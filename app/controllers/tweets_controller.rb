class TweetsController < ApplicationController
  before_action :get_data, only:[:show, :edit, :update, :destroy, :index, :create]

  def show
  end

  def edit
  end

  def index
    @tweets = @user.tweets
  end

  def new
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.new
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
    @tweet = @user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to user_tweet_path(@user, @tweet)
    else
      redirect_to new_user_tweet_path(@user)
    end
  end

  private
    def get_data
      @user = User.find(params[:user_id])
    end

    def tweet_params
      params.require(:tweet).permit([:status])
    end
end
