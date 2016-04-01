class Hashtag < ActiveRecord::Base
  has_and_belongs_to_many :tweets

  def render_with_hashtags
    tweet_words = tweet.split(" ")
    tweet_with_links = tweet_words.map do |word| 
    if word.include?("#")
        link_to word, hashtag_path(word)
      else
        word
      end
    end
    return tweet_with_links.join(" ")
  end
end
