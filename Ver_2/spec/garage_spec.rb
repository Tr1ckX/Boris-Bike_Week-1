require './lib/garage'

describe Garage do

  it_behaves_like 'bike_container'

  let(:garage) {Garage.new capacity: 50 } 
  let(:bike) {double :bike}
  let(:working_bike) {double :bike, broken?: false}
  let(:broken_bike) {double :bike, broken?: true}
  let(:container_holds_broken_bikes) {double :container, bikes_to_repair: [broken_bike]}

  it "should allow setting the garage's default capacity on initialising" do
    expect(garage.capacity).to eq(50)
  end

  it "should collect the broken bikes from the van" do
    expect(container_holds_broken_bikes).to receive(:release).with(broken_bike)
    garage.collect_broken_bikes_from(container_holds_broken_bikes)
  end

  it "should repair the broken bikes" do
    garage.dock(broken_bike)
    garage.dock(working_bike)
    expect(broken_bike).to receive(:fix!)
    expect(working_bike).not_to receive(:fix!)
    garage.repair(garage.bikes)
  end
end