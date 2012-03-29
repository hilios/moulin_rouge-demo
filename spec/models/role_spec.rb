require 'spec_helper'

describe Role do
  let(:role) { FactoryGirl.create(:role) }
  
  describe "database" do
    it { should have_db_column(:name).of_type(:string) }
  end
  
  describe "relations" do
    it { should have_and_belong_to_many(:user) }
  end
  
  describe "validations" do
    subject { role }
    it { should validate_uniqueness_of(:name) }
  end
  
  describe "#to_sym" do
    it "returns the name to_sym" do
      role.to_sym.should be(role.name.to_sym)
    end
    
    it "returns nil if name is not defined" do
      role = Role.new
      role.to_sym.should be_nil
    end
  end
end
