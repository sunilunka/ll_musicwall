class Song < ActiveRecord::Base

  validates :songtitle, presence: true
  validates :author, presence: true 

end