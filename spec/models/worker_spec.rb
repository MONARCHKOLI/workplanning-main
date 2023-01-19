require 'rails_helper'

RSpec.describe Worker do
  describe "validations" do
    it "is valid with valid parameters" do
      worker = Worker.new(name:"monarch",shift:"shift-2",date:"12/12/2023")
      expect(worker).to be_valid
    end

    it "is with invalid parameters name" do
      worker = Worker.new(shift:"shift-2",date:"12/12/2023")
      expect(worker).to_not be_valid 
    end

    it "is with invalid parameters shift" do
      worker = Worker.new(name:"abcd",date:"12/12/2023")
      expect(worker).to_not be_valid 
    end

    it "is with invalid parameters date" do
      worker = Worker.new(shift:"shift-2",name:"abcd")
      expect(worker).to_not be_valid 
    end


    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:shift) }
    it { should validate_presence_of(:date) }
  end
end
