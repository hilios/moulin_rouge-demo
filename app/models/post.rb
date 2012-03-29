class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  validates_presence_of :user
  validates_associated  :user
  validates_presence_of :title
end
