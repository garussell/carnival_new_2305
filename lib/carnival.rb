class Carnival
  attr_reader :duration,
              :rides

  def initialize(duration, rides)
    @duration = duration
    @rides = rides
  end

  def most_popular_ride
    popular_ride = rides.max_by do |ride|
      ride.last.rider_log.count
    end
    popular_ride[1]
  end
end