class Bike
  attr_accessor :status

  def initialize(status = "okay")
    @status = status
  end

  def working?
    if @status == 'okay'
      true
    elsif @status == 'broken'
      false
    end
  end
end
