require 'spec_helper'

describe User do
  describe "database" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:username).of_type(:string) }
    it { should have_db_column(:password_digest).of_type(:string) }
  end
  
  describe "relations" do
    it { should have_and_belong_to_many(:roles) }
    it { should have_many(:posts) }
  end
  
  describe "validations" do
    subject { FactoryGirl.create(:user) }
    it { should validate_presence_of(:name) }
    it { should allow_value("foo_bar").for(:username) }
    it { should_not allow_value("Foo Bar").for(:username) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should_not allow_mass_assignment_of(:password_digest) }
    it { should_not allow_value("different than confirmation").for(:password) }
    
    describe "on create" do
      subject { FactoryGirl.build(:user) }
      it { should validate_presence_of(:password) }
    end
  end
  
  describe "#is?" do
    let(:role) { FactoryGirl.create(:role, :name  => :guest) }
    let(:user) { FactoryGirl.create(:user, :roles => [role]) }
    it "returns true if role relation exists and false otherwise" do
      user.is?(:guest).should be_true
      user.is?(:admin).should be_false
    end
  end
end
