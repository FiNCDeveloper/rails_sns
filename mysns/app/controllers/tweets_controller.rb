# ツイートの操作
class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tweets = Tweet.all.order(created_at: 'desc')
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet[:user_id] = current_user.id
    if @tweet.save
      redirect_to tweets_path
    else
      render 'new'
    end
  end

  def edit
    if @tweet.user_id != current_user.id
      render plain: "編集・削除は作成者のみです"
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render 'edit'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end