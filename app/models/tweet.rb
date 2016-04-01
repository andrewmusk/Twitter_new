class Tweet < ActiveRecord::Base
	belongs_to :user
  has_and_belongs_to_many :hashtags , dependent: :destroy
	validates :tweet, presence: true, length: { maximum: 140 }

  

end
