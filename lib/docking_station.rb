require_relative 'bike'
require 'bike_containers'

class DockingStation


  attr_reader :bikes, :capacity

  include BikeContainer

  def release_bike
    raise "No bikes available" if (dock_is_empty? || no_working_bike_available?)
    @bikes.delete(select_working_bike)
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
