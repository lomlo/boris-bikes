require 'docking_station'

describe DockingStation do
	it 'instance of docking station responds to release bike' do
		expect(subject).to respond_to(:release_bike)
	end

	it 'method release_bike gets working bike' do
		expect(subject.release_bike).to be_a (Bike)
	end

	it 'released bike works' do
		expect(Bike.new).to be_working
	end
end 
