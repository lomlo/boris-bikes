require 'docking_station'
require 'garage'
require 'bike_containers'

class Van
attr_reader :bikes

  include BikeContainer

  def collect_bikes_from_dock(dock)
  @bikes = dock.release_broken_bikes
  end

  def drop_bikes_at_garage (garage)
  garage.accept_bikes(@bikes)
  @bikes = []
  end

  def collect_bikes_from_garage(garage)
  @bikes = garage.bikes
  garage.bikes = []
  @bikes
  end

  def drop_bikes_at_dock(dock)
    @bikes.each {|bike| dock.add_bikes(bike)}
    @bikes = []
  end
end
