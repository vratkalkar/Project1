require 'spec_helper'

describe User do
  describe "#valid" do
    it "should create a user with valid info" do
      FactoryGirl.create(:user).should be_valid
    end

    it "should not save without a valid name" do
      FactoryGirl.build(:user, name: nil).should be_valid
    end

    it "should not save without email" do
      FactoryGirl.build(:user, email: nil).should_not be_valid
    end

    it "should not save without a password" do
      FactoryGirl.build(:user, password: nil).should_not be_valid
   end
 end
end
