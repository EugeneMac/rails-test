require 'spec_helper'

describe Post do
  
  describe '#title' do
    it "should not be empty" do
      post = FactoryGirl.build(:post, :title => "")
      post.should_not be_valid
      post.errors[:title].should include("can't be blank")
    end
  end
  
  describe '#title' do
    it "should have 5 or more symbols" do
      post = FactoryGirl.build(:post, :title => "aa")
      post.should_not be_valid
      post.errors[:title].should include("is too short (minimum is 5 characters)")
    end
  end 
   
  describe '' do
     it 'should be created' do
      post = FactoryGirl.build(:post)
      post.should be_valid
    end  
  end
  
   
  
end
