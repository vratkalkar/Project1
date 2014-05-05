require 'spec_helper'

describe Comment do
 describe "#valid" do
  it "has body text" do
    FactoryGirl.build(:comment, body:"").should be_valid
  end
  
 end
end

