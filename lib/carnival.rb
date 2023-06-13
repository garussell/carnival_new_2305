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

  def most_profitable_ride
    most_profit = rides.max_by do |ride|
      ride.last.total_revenue
    end
    most_profit[1]
  end

  def total_revenue_all_rides
    revenue_counter = 0
    rides.each do |ride|
      revenue_counter += ride.last.total_revenue
    end
    revenue_counter
  end

  # def summary
  #   {
  #     visitor_count: visitor_count
  #     revenue_earned: total_revenue_all_rides
  #   # visitors: create helper method that returns array of visitor hashes
  #   # rides: create helper method that returns array of ride hashes
  #   }
  # end

  # helper methods for summary

  # def visitor_count
  #   rides.values.flat_map { |ride| ride.rider_log.keys }.uniq.count
  # end
end