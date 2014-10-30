#link to the Bike class
require 'bike'

# we're describing the functionality of the Bike class

describe Bike do

  let(:bike) {Bike.new}

  #this is a specific behaviour
  it 'is not broken when created' do
    
    bike = Bike.new # initialize a new object of Bike class
    
    #expect a instance of this class to have a method "broken?" that should return false
    expect(bike).not_to be_broken
    expect(bike.broken?).to be false
  
  end

  it 'should be able to break' do
    bike.break!
    expect(bike).to be_broken
  end

  it 'should be able to get fixed' do
    bike.break!
    bike.fix!
    expect(bike).not_to be_broken
  end

end


