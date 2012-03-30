require 'spec_helper'

describe Post do
  describe "database" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:is_approved).of_type(:boolean).with_options(:default => false) }
  end
  
  describe "relations" do
    it { should belong_to(:user) }
  end
  
  describe "security" do
    it { should_not allow_mass_assignment_of(:approved) }
  end
  
  describe "validation" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:title) }
  end
end
