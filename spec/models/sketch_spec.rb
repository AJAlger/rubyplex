require 'rails_helper'

RSpec.describe Sketch, type: :model do

  before :each do
    @sketch = create(:sketch)
  end

  context "#initialize" do
    it "should have a slug" do
    end

    it "it should have a slug that's a hex number" do

    end
  end

end
