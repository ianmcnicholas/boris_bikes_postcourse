require_relative 'Bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "There are no bikes available" if @bikes.empty?
    Bike.new
  end

  def dock(bike)
    fail "The docking station is at capacity" if @bikes.any?
    @bikes << bike
  end

end
