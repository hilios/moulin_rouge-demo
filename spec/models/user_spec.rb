require 'spec_helper'

describe User do
  describe "database" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:role_id).of_type(:integer) }
    # Devise
    it { should have_db_column(:username).of_type(:string),with() }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    
    describe "indexes" do
      it { should have_db_index(:role_id).unique(true) }
      it { should have_db_index(:role_id) }
    end
  end
  
  describe "relations" do
    it { should belong_to(:role) }
    it { should have_many(:posts) }
  end
  
  describe "security" do
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
    it { should validate_presence_of(:role)}
    
    describe "on create" do
      subject { FactoryGirl.build(:user) }
      it { should validate_presence_of(:password) }
    end
  end
  
  describe "#is?" do
    let(:role) { FactoryGirl.create(:role, :name => :guest) }
    let(:user) { FactoryGirl.create(:user, :role => role) }
    it "returns true if role relation exists and false otherwise" do
      user.is?(:guest).should be_true
      user.is?(:admin).should be_false
    end
  end
end
