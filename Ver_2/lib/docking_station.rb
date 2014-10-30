 #load BikeContainer
 
 require_relative 'bike_container'


class DockingStation

  # this gives us all the methods that used to be in this class
  include BikeContainer

  def initialize(options = {})
=begin
    self.capacity is calling the capacity=() method (note the equals sign)
    defined in BikeContainer
    capacity (the second argument to fetch()) is calling the capacity() method in 
    BikeContainer
=end
  self.capacity = options.fetch(:capacity, capacity)
  end

end