require 'spec_helper'

describe ApplicationHelper do
  describe "#controller_is?" do
    before(:each) do
      controller.params[:controller] = "test"
    end
    
    it "should return true or false for controller name(s)" do
      helper.controller_is?('test').should be_true
      helper.controller_is?('fake').should be_false
      helper.controller_is?('fake', 'test').should be_true
      helper.controller_is?('fake', 'mock').should be_false
      # Same test with symbols
      helper.controller_is?(:test).should be_true
      helper.controller_is?(:fake).should be_false
      helper.controller_is?(:fake, :test).should be_true
      helper.controller_is?(:fake, :mock).should be_false
    end
    
    it "should execute block instead of returning true or fale" do
      helper.controller_is?('test') { |b| b.should be_true }
      helper.controller_is?('fake') { |b| b.should be_false }
      helper.controller_is?(:fake, :test) { |b| b.should be_true }
      helper.controller_is?(:fake, :mock) { |b| b.should be_false }
    end
  end
  
  describe "#action_is?" do
    before(:each) do
      controller.params[:action] = "test"
    end
    
    it "should return true or false for action name(s)" do
      helper.action_is?('test').should be_true
      helper.action_is?('fake').should be_false
      helper.action_is?('fake', 'test').should be_true
      helper.action_is?('fake', 'mock').should be_false
      # Same test with symbols
      helper.action_is?(:test).should be_true
      helper.action_is?(:fake).should be_false
      helper.action_is?(:fake, :test).should be_true
      helper.action_is?(:fake, :mock).should be_false
    end
    
    it "should execute block instead of returning true or fale" do
      helper.action_is?('test') { |b| b.should be_true }
      helper.action_is?('fake') { |b| b.should be_false }
      helper.action_is?(:fake, :test) { |b| b.should be_true }
      helper.action_is?(:fake, :mock) { |b| b.should be_false }
    end
  end
end