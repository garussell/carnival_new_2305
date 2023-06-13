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
    
    # visitors have money
    @visitor1 = Visitor.new('Bruce', 54, '$100')
    @visitor2 = Visitor.new('Tucker', 36, '$50')
    @visitor3 = Visitor.new('Penny', 64, '$150')
    # visitors have the preferences
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:gentle)

    @visitor1.add_preference(:thrilling)
    @visitor2.add_preference(:thrilling)
    @visitor3.add_preference(:thrilling)
    
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

  describe "#most_profitable_ride" do
    it "can tell us its most profitable ride" do
      # visitors board rides
      2.times do
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor3)
      end

      @ride2.board_rider(@visitor3)

      2.times do
        @ride3.board_rider(@visitor1)
        @ride3.board_rider(@visitor3)
      end

      expect(@fun_land.most_profitable_ride).to eq(@ride3)
    end
  end

  describe "#total_revenue_all_rides" do
    it "can calculate the total revenue earned from all its rides" do
      # visitors board rides
      2.times do
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor3)
      end

      @ride2.board_rider(@visitor3)

      2.times do
        @ride3.board_rider(@visitor1)
        @ride3.board_rider(@visitor3)
      end

      expect(@fun_land.total_revenue_all_rides).to eq(19)
    end
  end

  describe "#summary" do
    it "can provide a summary hash" do
      summary_data = {
        visitor_count: 3,
        revenue_earned: 20,
        visitors: [
          {
            visitor: @visitor1,
            favorite_ride: @ride1,
            total_money_spent: 4
          },
          {
            visitor: @visitor2,
            favorite_ride: @ride2,
            total_money_spent: 6
          },
          {
            visitor: @visitor3,
            favorite_ride: @ride3,
            total_money_spent: 3
          }
        ],
        rides: [
          {
            ride: @ride1,
            riders: [@visitor1, @visitor2],
            total_revenue: 6
          },
          {
            ride: @ride2,
            riders: [@visitor2],
            total_revenue: 5
          },
          {
            ride: @ride3,
            riders: [@visitor1, @visitor3],
            total_revenue: 8
          }
        ]
      }

      allow(@fun_land).to receive(:summary).and_return(summary_data)

      expect(@fun_land.summary).to eq({})
    end
  end

  # helper methods for summary

  describe "#visitor_count" do
    it "can count total number of visitors" do
       # visitors board rides
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor3)
    
      @ride2.board_rider(@visitor3)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor3)
  
      expect(@fun_land.visitor_count).to eq(3)
    end
  end

  # describe "#visitor_data" do
  #   it "can return an array of visitor information" do
  #     # visitors board rides
  #     @ride1.board_rider(@visitor1)
  #     @ride1.board_rider(@visitor2)
  #     @ride1.board_rider(@visitor3)
    
  #     @ride2.board_rider(@visitor3)
  #     @ride3.board_rider(@visitor1)
  #     @ride3.board_rider(@visitor3)

  #     visitors: [
  #         {
  #           visitor: @visitor1,
  #           favorite_ride: @ride1,
  #           total_money_spent: 3
  #         },
  #         {
  #           visitor: @visitor2,
  #           favorite_ride: @ride2,
  #           total_money_spent: 1
  #         },
  #         {
  #           visitor: @visitor3,
  #           favorite_ride: @ride3,
  #           total_money_spent: 8
  #         }
  #       ]

  #     expect(@fun_land.visitor_data).to eq(visitors)
  #   end
  end
end