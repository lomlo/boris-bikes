require 'docking_station'

describe DockingStation do
	it 'instance of docking station responds to release bike' do
		expect(subject).to respond_to(:release_bike)
	end

	it 'docking station should release a bike' do
		expect(subject.release_bike).to be_a (Bike)
	end

	it 'should release a working bike' do
		station = DockingStation.new
		bike = station.release_bike
		expect(bike).to be_working
	end

	it 'should be able to respond to dock method' do
		expect(subject).to respond_to(:dock).with(1).argument
	end

	it 'keeps track of stored and released bikes' do
		expect(subject).to respond_to(:bike)
	end

	it 'docks a bike' do
		bike = Bike.new
		subject.dock(bike)
		expect(subject.bike).to eq bike
	end

end
