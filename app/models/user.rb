class User < ActiveRecord::Base
  devise :database_authenticatable

  belongs_to :role
  has_many :posts
  
  attr_accessible :name, :username, :password, :password_confirmation, :remember_me
  
  attr_accessible :name, :username, :password, :password_confirmation, :remember_me, :role_id,
    as: :admin
  
  validates_presence_of     :name
  validates_format_of       :username, :with => /^[\w\d_]+$/
  validates_presence_of     :role
  validates_associated      :role
  
  delegate :name, :to => :role, :prefix => true, :allow_nil => true
  
  def is?(*roles)
    not roles.index(role.to_sym).nil? if role
  end
end
