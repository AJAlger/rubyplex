require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = create(:user)
  end

  context "#initialize" do
    it "should initialize the role to standard" do
      expect(@user.role).to eq "standard"
    end
  end

  context "role validation" do

    it "should validate whether a user has a role" do
      @user.role = ""
      expect(@user.valid?).to eq false
      expect(@user.errors[:role]).to include "can't be blank"
    end

    it "should have a valid role" do
      @user.role = "foo"
      expect(@user.valid?).to eq false
      expect(@user.errors[:role]).to eq ["should be one of admin, pro, standard"]
    end
  end

  context ".upgrade_account" do

    it "should allow standard user to become pro user" do
      @user.upgrade_account
      expect(@user.role).to eq "pro"
    end

    it "should not allow admin to become pro user" do
      @user.role = "admin"
      @user.upgrade_account
      expect(@user.role).not_to eq "pro"
      expect(@user.role).to eq "admin"
    end
  end

  context ".downgrade_account" do

    it "should downgrade a user role from pro to standard" do
      @user.role = "pro"
      @user.downgrade_account
      expect(@user.role).not_to eq "pro"
    end

    it "should not downgrade an admin to a standard user" do
      @user.role = "admin"
      @user.downgrade_account
      expect(@user.role).not_to eq "standard"
    end
  end

end
