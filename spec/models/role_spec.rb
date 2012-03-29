require 'spec_helper'

describe Role do
  describe "database" do
    it { should have_db_column(:name) }
  end
  
  describe "relations" do
    it { should have_and_belong_to_many(:user) }
  end
  
  describe "validations" do
    subject { FactoryGirl.create(:role) }
    it { should validate_uniqueness_of(:name) }
  end
end
