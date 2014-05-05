require 'spec_helper'

describe Topic do

  describe "#valid" do

  it "will not save without a topic name" do
    FactoryGirl.build(:topic, name:nil).should_not be_valid
  end

  it "will not save without a description" do
    FactoryGirl.build(:topic, description:nil).should_not be_valid
  end

  
 end
end
