require 'spec_helper'

describe User do
  describe "database" do
    it { should have_db_column(:email) }
    it { should have_db_column(:password_digest) }
  end
  
  describe "relations" do
    it { should have_and_belong_to_many(:roles) }
  end
  
  describe "validations" do
    subject { FactoryGirl.create(:user) }
    it { should validate_uniqueness_of(:email) }
  end
end
