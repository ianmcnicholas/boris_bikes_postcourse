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
end
