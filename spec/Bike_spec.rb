require 'Bike'

describe Bike do
  it 'should respond to working?' do
    expect(subject).to respond_to :working?
  end
end
