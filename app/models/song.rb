class Song < ActiveRecord::Base

  belongs_to :user
  has_many :upvotes

  validates :songtitle, presence: true
  validates :author, presence: true 

end