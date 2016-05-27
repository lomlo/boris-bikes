require_relative 'bike'
require 'bike_containers'

class DockingStation


  attr_reader :bikes, :capacity

  include BikeContainer

  def release_bike
    raise "No bikes available" if (dock_is_empty? || no_working_bike_available?)
    @bikes.delete(select_working_bike)
  end

  def dock(bike, broken = false)
  	raise "Docking station is full" if dock_is_full?
    bike.broken = broken
    @bikes << bike
  end

  def release_broken_bikes
    sorted = @bikes.partition {|x| x.broken? == true}
    @bikes = sorted[1]
    sorted[0]
  end

  private

  def dock_is_empty?
    @bikes.count <= 0
  end

  def dock_is_full?
    @bikes.count >= @capacity
  end

  def broken_bikes_count
    @bikes.select {|bike| bike.broken? == true}.count
  end

  def list_broken_bikes
  @bikes.select {|bike| bike.broken? == true}
  end

  def working_bikes_count
    @bikes.select {|bike| bike.broken? == false}.count
  end

  def no_working_bike_available?
    working_bikes_count - broken_bikes_count <= 0
  end

  def select_working_bike
    @bikes.find {|bike| bike.broken? == false }
  end
end


# [1] pry(main)> require './lib/docking_station'
# => true
# [2] pry(main)> docking_station = DockingStation.new
# => #<DockingStation:0x007fa433224c58>
# [3] pry(main)> bike = Bike.new
# => #<Bike:0x007fa433165268>
# [4] pry(main)> docking_station.dock(bike)
# => RuntimeError: Docking station full
# [5] pry(main)> 21.times {docking_station.release_bike}
# RuntimeError: No bikes available
# from /Users/abdullamahmood/Projects/boris-bikes/lib/docking_station.rb:8:in `release_bike'
