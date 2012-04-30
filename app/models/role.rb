class Role < ActiveRecord::Base
  has_many :users
  
  validates_uniqueness_of :name
  validates_format_of :name, :with => /^[a-zA-Z0-9_-]+$/
  validates_inclusion_of :name, :in => MoulinRouge::Authorization.roles.map(&:to_s)
  
  def to_sym
    name.to_sym if name
  end
end
