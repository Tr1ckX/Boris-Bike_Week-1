class Bike
  
  # the initialize method is always called when you
  # create a new class by typing Bike.new
  
  def initialize
    fix!
  end

  def broken?         # all instance variables begin with "@"
    @broken           # this must be an instance variable because 
  end                 # we'll need it in other methods

  def break!
    @broken = true    # instance variables are accessible in all methods 
  end

  def fix!
    @broken = false   # and any instance method can update them
  end

end

