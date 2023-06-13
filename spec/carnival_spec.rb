require './spec/spec_helper'

RSpec.describe Carnival do
  before(:each) do
    # rides
    @ride1 = Ride.new({ 
      name: 'Carousel', 
      min_height: 24, 
      admission_fee: 1, 
      excitement: :gentle 
    })
    @ride2 = Ride.new({ 
      name: 'Ferris Wheel', 
      min_height: 36, 
      admission_fee: 5, 
      excitement: :gentle 
    })
    @ride3 = Ride.new({ 
      name: 'Roller Coaster', 
      min_height: 54, 
      admission_fee: 2, 
      excitement: :thrilling 
    })
    @rides = { ride1: @ride1, ride2: @ride2, ride3: @ride3 }
    
    # visitors
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    
    # carnivals
    @fun_land = Carnival.new(14, @rides)
  end
  
  describe "#initialize" do 
  it "exists and has attributes" do
      expect(@fun_land).to be_an_instance_of(Carnival)
      expect(@fun_land.duration).to eq(14)
      expect(@fun_land.rides).to eq(@rides)
    end
  end

  describe "#duration" do
    it "has a duration as well as a way to read that data" do

    end
  end
end