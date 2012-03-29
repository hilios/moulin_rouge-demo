class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  
  has_secure_password
  
  attr_accessible :username, :password, :password_confirmation
  
  validates_presence_of     :password, :on => :create
  validates_confirmation_of :password, :unless => lambda { |user| user.password.blank? }
  validates_uniqueness_of   :username
end
