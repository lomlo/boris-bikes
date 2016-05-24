require 'docking_station'

describe DockingStation do
	it 'instance of docking station responds to release bike' do
		expect(subject).to respond_to(:release_bike)
	end

end 
