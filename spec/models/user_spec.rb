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

end
