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
    @bikes << bike
  end

end
