require 'DockingStation'

describe DockingStation do

  it 'should respond to :release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'should release a bike and check if it works' do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'should respond to :dock(bike)' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'should allow user to see if bikes are available' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to include(bike)
  end

  it 'should not release a bike if there are none available' do
    expect{ subject.release_bike }.to raise_error("There are no bikes available")
  end

  it 'should not allow more than the default capacity number of bikes to be docked at a time' do
    DockingStation::DEFAULT_CAPACITY.times{ subject.dock(Bike.new) }
    new_bike = Bike.new
    expect{ subject.dock(new_bike) }.to raise_error("The docking station is at capacity")
  end

  it 'should update number of bikes apropriately when it docks a bike' do
    subject.dock(Bike.new)
    expect(subject.bikes.length).to eq 1
  end

  it 'should update number of bikes apropriately when it releases a bike' do
    subject.dock(Bike.new)
    subject.release_bike
    expect(subject.bikes.length).to eq 0
  end

  it 'docking stations are created with a default capacity of 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'allows system maintainer to set a capacity for docking station' do
   station = DockingStation.new(10)
   expect(station.capacity).to eq 10
  end

  it 'allows the user to log their bike as broken' do
    bike = Bike.new
    subject.dock(bike, 'broken')
    expect(bike.working?).to eq false
  end
end
