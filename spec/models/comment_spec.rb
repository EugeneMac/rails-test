require 'spec_helper'

describe Comment do
  
  describe '' do
    it "should be created" do
      @comment = FactoryGirl.build(:comment)
      @comment.should be_valid
    end
  end
  
end