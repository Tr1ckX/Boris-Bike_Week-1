require_relative 'bike_container'

class Garage

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def repair(bikes_to_repair)
    bikes_to_repair.each do |one_broken_bike|
      fix!(one_broken_bike)
    end
  end


end
