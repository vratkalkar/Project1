require 'spec_helper'

describe Article do
  describe "#valid" do
   it "should have body text" do
    FactoryGirl.create(:article, body: "").should be_valid
  end

  it "should have a title" do
    FactoryGirl.build(:article, title:"").should be_valid
  end
 end
end
