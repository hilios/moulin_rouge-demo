require 'spec_helper'

describe Post do
  describe "database" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
  end
  
  describe "relations" do
    it { should belong_to(:user) }
  end
  
  describe "validation" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:title) }
  end
end
