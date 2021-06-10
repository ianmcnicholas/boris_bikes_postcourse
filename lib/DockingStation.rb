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
    fail "No working bikes are available" if @bikes[-1].status == "broken"
    @bikes.pop
  end

  def dock(bike, condition = "okay")
    fail "The docking station is at capacity" if full?
    if condition == "broken"
      bike.status = "broken"
      @bikes.insert(0, bike)
    else
      @bikes << bike
    end
  end

  private

  def full?
    @bikes.length == @capacity
  end

end
