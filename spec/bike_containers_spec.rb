require 'bike_containers'
require 'van'


shared_examples_for "bike_containers" do
  let(:bike_containers) { described_class.new(2)}
  describe '#bikes' do
    it "it has a storage for bikes" do
      expect(bike_containers.bikes).to eq([])
    end
  end
  describe '#add_bikes' do
    it 'adds bikes to the containers' do
    bike_containers.bikes = ["bike1"]
    expect(bike_containers.add_bikes("bike")).to eq ["bike1","bike"]
    end
  end
end

describe Van do
  it_behaves_like "bike_containers"
end
describe Garage do
  it_behaves_like "bike_containers"
end
describe DockingStation do
  it_behaves_like "bike_containers"
end
