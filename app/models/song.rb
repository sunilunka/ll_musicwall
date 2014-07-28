class Song < ActiveRecord::Base

  has_one :user

  validates :songtitle, presence: true
  validates :author, presence: true 

end