class Bike
  attr_reader :status

  def initialize
    @status = 'okay'
  end

  def working?
    if @status == 'okay'
      true
    elsif @status == 'broken'
      false
    end
  end
end