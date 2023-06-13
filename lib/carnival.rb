class Carnival
  attr_reader :duration,
              :rides

  def initialize(duration, rides)
    @duration = duration
    @rides = rides
  end
end