require './lib/docking_station'

describe DockingStation do

  it_behaves_like 'bike_container'

  let(:station) {DockingStation.new capacity: 123 }
  let(:working_bike) {double :bike, broken?: false }
  let(:container_holds_working_bikes) {double :container, available_bikes: [working_bike]}

  it "should allow setting the docking station's default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it 'should collect the working bikes from the van' do
    expect(container_holds_working_bikes).to receive(:release).with(working_bike)
    station.collect_working_bikes_from(container_holds_working_bikes)
  end

  it 'should release only working bike to person' do
    
  end
end
