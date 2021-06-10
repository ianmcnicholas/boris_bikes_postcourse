require_relative 'Bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "There are no bikes available" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail "The docking station is at capacity" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length == 20
  end

end
