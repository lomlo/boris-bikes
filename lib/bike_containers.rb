
module BikeContainer
    attr_accessor :bikes

    DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
      @bikes = []
      @capacity = capacity
    end

    def add_bikes(bike)
      raise "The container is full" if @bikes.count >= @capacity
      @bikes << bike
    end
end
