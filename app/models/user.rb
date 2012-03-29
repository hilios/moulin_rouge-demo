class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  
  has_many :posts
  
  has_secure_password
  
  attr_accessible :name, :username, :password, :password_confirmation
  
  validates_presence_of     :name
  validates_presence_of     :password, :on => :create
  validates_confirmation_of :password, :unless => lambda { |user| user.password.blank? }
  validates_presence_of     :username
  validates_uniqueness_of   :username
  validates_format_of       :username, :with => /^[\w\d_]+$/
  
  def is?(role)
    roles.exists?(:name => role)
  end
end
