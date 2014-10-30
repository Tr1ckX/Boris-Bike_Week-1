require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

  let(:bike) {double :bike}
  let(:holder) {ContainerHolder.new}

  it 'should accept a bike' do
    # we expect the holder to have 0 bikes
    expect(holder.bike_count).to eq(0)
    # let's dock a bike into the holder
    holder.dock(bike)
    # now we expect the holder to have 1 bike
    expect(holder.bike_count).to eq(1)
  end

end


