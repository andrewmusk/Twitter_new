class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
    @tweet = Tweet.new
    @user = current_user
	end
	def show
    @user = User.find(params[:id])
	end
  def home 
    @tweet = Tweet.new
    @tweets = Tweet.all
  end
  def all
    @users = User.all
  end
  def following
    @title = "Following"
    @user = current_user
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = current_user
    @users = @user.followers
    render 'show_follow'
  end
  def update

  end

end
