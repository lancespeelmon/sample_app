require 'spec_helper'

describe UsersController do
  before do
    @user  = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
    sign_in @admin
  end
	describe "destroy" do
    it "destroys a regular user" do
      expect { delete(:destroy, id: User.find(@user.id)) }.to change(User, :count).by(-1)
    end
    it "cannot not destroy self" do
      expect { delete(:destroy, id: User.find(@admin.id)) }.to change(User, :count).by(0)
    end
	end
end
