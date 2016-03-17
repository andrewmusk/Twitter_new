class TweetsController < ApplicationController
	def create 
    @user = current_user
    @tweet = @user.tweets.create(comment_params)
    redirect_to users_index_path
	end
  def destroy
    @user = current_user
    @tweet = @user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to users_index_path
  end
  private 
    def comment_params
      params.require(:tweet).permit(:tweet)
    end
end
