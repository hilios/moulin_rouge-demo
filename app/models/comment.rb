class Comment < ActiveRecord::Base
  belongs_to :post
  
  attr_accessible :post, :from, :message
  attr_accessible :post, :from, :message, :is_approved, :as => [:admin, :editor]
  
  scope :approved, where('is_approved = ?', true)
end
