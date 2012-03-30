class Role < ActiveRecord::Base
  has_many :users
  
  validates_uniqueness_of :name
  
  def to_sym
    name.to_sym if name
  end
end
