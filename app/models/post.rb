class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  validates_presence_of :user
  validates_associated  :user
  validates_presence_of :title
  
  delegate :name, :to => :user, :prefix => true, :allow_nil => true
  
  attr_accessible :title, :body
  attr_accessible :title, :body, :user_id, :is_approved, 
    :as => :admin

  scope :approved, where('is_approved = ?', true)
end
