require_relative 'Bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "There are no bikes available" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike, condition = "okay")
    fail "The docking station is at capacity" if full?
    if condition == "broken"
      bike.status = "broken"
    end
    @bikes << bike
  end

  private

  def full?
    @bikes.length == @capacity
  end

end
