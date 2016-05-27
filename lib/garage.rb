require 'bike_containers'

class Garage

  include BikeContainer

  def accept_bikes(bikes)
    @bikes = bikes
    fix_bikes
  end

  private

  def fix_bikes
  @bikes.each {|bike| bike.broken = false}
  end
end
