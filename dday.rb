class DDay
  def initialize(year, month, day)
    @dday = Date.new(year, month, day)

    t = Time.now
    @year = t.year
    @month = t.month
    @day = t.day
    @t = Date.new(@year, @month, @day)
    
    @days_to_go = (@t - @dday).to_i
    if self.passed?
      @days_to_go = @days_to_go + 1
    end
  end
  
  def is_it_dday?
    @dday.year == @year && @dday.month == @month && dday.day == @day
  end
  
  def passed?
    @days_to_go >= 0
  end
  
  def coming
    passed? ? :passed : :coming
  end
  
  def days_to_go
    @days_to_go
  end

end