class Tweet < ActiveRecord::Base
	belongs_to :user
  has_many :hashtags, through: :linking
  has_many :linking
	validates :tweet, presence: true, length: { maximum: 140 }
end
