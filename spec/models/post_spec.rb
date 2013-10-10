require 'spec_helper'

describe Post do
  
  describe '#title' do
    it "should not be empty" do
      post = FactoryGirl.build(:post, :title => "")
      post.should_not be_valid
      post.errors[:title].should include("can't be blank")
    end
end  
end
