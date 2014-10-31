module BikeContainer

  DEFAULT_CAPACITY = 20

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise "Station is full" if full?
    bikes << bike
  end

  def release(bike)
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject {|bike| bike.broken? }
  end

  def bikes_to_repair
    bikes.select {|bike| bike.broken? }
  end

  def collect_broken_bikes_from(container)
    collect_bikes(container.bikes_to_repair, container)
  end

  def collect_working_bikes_from(container)
    collect_bikes(container.available_bikes, container)
  end

  def collect_bikes(bikes, container)
      bikes.each do |one_working_bike|
        container.release(one_working_bike)
        self.dock(one_working_bike)
    end
  end

end