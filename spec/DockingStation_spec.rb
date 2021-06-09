require 'DockingStation'

describe DockingStation do

  it "should respond to 'release_bike'" do
    expect(subject).to respond_to :release_bike
  end

  it 'should release a bike and check if it works' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'should respond to dock(bike)' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'should allow user to see if bikes are available' do
    bike = subject.release_bike
    subject.dock(bike)
    expect(subject.bikes).to include(bike)
  end
end
