require 'rails_helper'

RSpec.describe Sketch, type: :model do

  before :each do
    @sketch = create(:sketch)
  end

  context "#initialize" do
    xit "it should have a slug that's a hex number" do

    end
  end

  context "sketch title validation" do
    it "should have a valid title" do
      @sketch.title = ""
      expect(@sketch.valid?).to eq false
      expect(@sketch.errors[:title]).to include "can't be blank"
    end

  end

end
