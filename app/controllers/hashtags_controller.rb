class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by(hashtag: (params[:id]))
    @tweets = @hashtag.tweets
  end
  def index

  end
end
