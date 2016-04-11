class Hashtag < ActiveRecord::Base
  has_many :tweets, through: :linkings
  has_many :linkings

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
