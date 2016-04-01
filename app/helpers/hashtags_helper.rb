module HashtagsHelper
  def render_with_hashtags(tweet)
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
