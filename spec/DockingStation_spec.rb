require 'DockingStation'

describe DockingStation do

let(:bike) { double :bike }

before(:each) do
  allow(bike).to receive(:working?).and_return(true)
  allow(bike).to receive(:status).and_return("okay")
 end

  it 'should respond to :release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'should release a bike and check if it works' do
    subject.dock(bike)
    trike = subject.release_bike
    expect(trike).to be_working
  end

  it 'should respond to :dock(bike)' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'should allow user to see if bikes are available' do
    subject.dock(bike)
    expect(subject.bikes).to include(bike)
  end

  it 'should not release a bike if there are none available' do
    expect{ subject.release_bike }.to raise_error("There are no bikes available")
  end

  it 'should not allow more than the default capacity number of bikes to be docked at a time' do
    DockingStation::DEFAULT_CAPACITY.times{ subject.dock(bike) }
    new_bike = double(:bike)
    expect{ subject.dock(new_bike) }.to raise_error("The docking station is at capacity")
  end

  it 'should update number of bikes apropriately when it docks a bike' do
    subject.dock(bike)
    expect(subject.bikes.length).to eq 1
  end

  it 'should update number of bikes apropriately when it releases a bike' do
    subject.dock(bike)
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
    # bike = Bike.new
    allow(bike).to receive(:status).and_return("broken")
    p bike.status
    # expect(Comment).to receive(:find).and_return(comment)
    expect(bike).to receive(:status).with("broken")
    subject.dock(bike, "broken")
    expect(bike.working?).to eq false
  end

  it 'does not release a broken bike if there is only one bike in the station' do
    bike = Bike.new
    subject.dock(bike, "broken")
    expect{ subject.release_bike }.to raise_error "No working bikes are available"
  end

  it 'does not release any broken bikes' do
    good_bike = Bike.new
    bad_bike = Bike.new
    subject.dock(good_bike)
    subject.dock(bad_bike, "broken")
    expect(subject.release_bike).to eq good_bike
  end

end
