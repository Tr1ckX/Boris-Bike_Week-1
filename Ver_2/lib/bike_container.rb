module BikeContainer

  DEFAULT_CAPACITY = 20

  def bikes
    @bikes ||= []
  end

  def capacity=(value)
    @capacity = value
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
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
    bikes = container.bikes_to_repair
    collect_bikes(bikes, container)
  end

  def collect_working_bikes_from(container)
    bikes = container.available_bikes
    collect_bikes(bikes, container)
  end

  def collect_bikes(bikes, container)
      bikes.each do |bike|
      container.release(bike)
      self.dock(bike)
    end
  end

end