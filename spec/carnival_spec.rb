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

  describe "#most_popular_ride" do
    it "can tell us its most popular ride" do
      # visitors have the preferences
      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @visitor3.add_preference(:gentle)

      @visitor1.add_preference(:thrilling)
      @visitor2.add_preference(:thrilling)
      @visitor3.add_preference(:thrilling)

      # visitors board rides
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor3)

      @ride2.board_rider(@visitor3)

      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor3)

      expect(@fun_land.most_popular_ride).to eq(@ride1)
    end
  end
end