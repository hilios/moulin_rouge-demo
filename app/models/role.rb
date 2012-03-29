class Role < ActiveRecord::Base
  has_and_belongs_to_many :user
  
  validates_uniqueness_of :name
  
  def to_sym
    name.to_sym if name
  end
end
