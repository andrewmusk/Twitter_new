class TweetsController < ApplicationController
	def create 
    @user = current_user
    @tweet = @user.tweets.create(tweet_params)
    hashtag_finder(@tweet)
    redirect_to :back
	end
  def edit
    @tweet = current_user.tweets.find(params[:id])
  end
  def update
    @user = current_user
    @tweet = @user.tweets.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end
  def destroy
    @user = current_user
    @tweet = @user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to :back
  end

  def hashtag_finder(tweet)
    tweet_words = tweet.tweet.split(" ")
    tweet_with_hashtags = tweet_words.map do |word|
      if word.include?('#')
        unless Hashtag.any?{|a| a.hashtag == word}
          tweet.hashtags.create(hashtag: word)
        else
          @hashtag = Hashtag.find_by(hashtag: word)
          tweet.linking.create(hashtag_id: @hashtag.id, tweet_id: @tweet.id)
        end
        
      end
    end
  end

  private 
    def tweet_params
      params.require(:tweet).permit(:tweet)
    end
end
