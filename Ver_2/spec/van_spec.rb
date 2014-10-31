require './lib/van'


describe Van do

  it_behaves_like 'bike_container'
  
  let(:van) {Van.new capacity: 25}
  let(:working_bike) {double :bike, broken?: false }
  let(:broken_bike) {double :bike, broken?: true }
  let(:container_holds_broken_bikes) {double :container, bikes_to_repair: [broken_bike]}
  let(:container_holds_working_bikes) {double :container, available_bikes: [working_bike]}

  it "should allow setting the van's default capacity on initialising" do
    expect(van.capacity).to eq(25)
  end

  it 'should collect the broken bikes from the docking station' do
    expect(container_holds_broken_bikes).to receive(:release).with(broken_bike)
    van.collect_broken_bikes_from(container_holds_broken_bikes)
  end

  it 'should collect the working bikes from the garage' do
    expect(container_holds_working_bikes).to receive(:release).with(working_bike)
    van.collect_working_bikes_from(container_holds_working_bikes)
  end

end