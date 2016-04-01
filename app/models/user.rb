class User < ActiveRecord::Base
	has_many :tweets
  # This is relationship used for users that a specific users follows
  has_many :active_relationships, class_name: 'Relationship', 
                                  foreign_key:'follower_id',
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  # This is relationship used for users that follow a specific user
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

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

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
