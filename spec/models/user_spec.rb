require 'spec_helper'

describe User do
  
  describe '' do
    it 'should be signed up' do
      @user = FactoryGirl.create(:user)
      @user.should be_valid
    end
  end
  
end