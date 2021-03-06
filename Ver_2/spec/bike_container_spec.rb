require './lib/bike_container'

shared_examples 'bike_container' do

  let(:holder) {described_class.new}
  let(:bike) {double :bike}
  let(:broken_bike) {double :bike, broken?: true}
  let(:working_bike) {double :bike, broken?: false}
  let(:container) {double :container}

    it 'should accept a bike' do
    # we expect the holder to have 0 bikes
    expect(holder.bike_count).to eq(0)
    # let's dock a bike into the holder
    holder.dock(bike)
    # now we expect the holder to have 1 bike
    expect(holder.bike_count).to eq(1)
  end

  it 'should release a bike' do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq (0)  end

  it 'should know when it is full' do
    expect(holder).not_to be_full
    holder.capacity.times {holder.dock(bike)}
    expect(holder).to be_full
  end

  it 'should not accept bike if it is full' do
    holder.capacity.times {holder.dock(bike)}
    expect(lambda {holder.dock(bike)}).to raise_error(RuntimeError)
  end

  it 'should provide a list of the available bikes' do
    holder.dock(broken_bike)
    holder.dock(working_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end

  it 'should provide a list of the broken bikes' do
    holder.dock(broken_bike)
    expect(holder.bikes_to_repair).to eq([broken_bike])
  end

  it 'should collect bikes from a container' do
    bikes = [bike]
    expect(container).to receive(:release)
    holder.collect_bikes(bikes, container)
    expect(holder.bike_count).to eq 1
  end

  it 'should not collect anything from empty container' do
    bikes = []
    holder.collect_bikes(bikes, container)
    expect(holder.bike_count).to eq 0
  end

end
