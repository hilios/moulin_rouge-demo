require 'spec_helper'

describe Comment do
  describe "database" do
    it { should have_db_column(:post_id).of_type(:integer) }
    it { should have_db_column(:from).of_type(:string) }
    it { should have_db_column(:message).of_type(:text) }
    it { should have_db_column(:is_approved).of_type(:boolean).with_options(:default => false) }
    
    describe "indexes" do
      it { should have_db_index(:post_id) }
    end
  end
  
  describe "security" do
    it { should_not allow_mass_assignment_of(:approved) }
  end
  
  describe "relations" do
    it { should belong_to(:post) }
  end
end
