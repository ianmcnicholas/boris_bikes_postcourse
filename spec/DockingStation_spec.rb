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

  it 'should not allow more than 1 bike to be docked at a time' do
    bike = Bike.new
    subject.dock(bike)
    new_bike = Bike.new
    expect{ subject.dock(new_bike) }.to raise_error("The docking station is at capacity")
  end

end
