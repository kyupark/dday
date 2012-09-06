require 'active_support/core_ext/integer/inflections'

def ordinal value
  case value.to_s
  when /^[0-9]*[1][0-9]$/
    suffix = "th"
  when /^[0-9]*[1]$/
    suffix = "st"
  when /^[0-9]*[2]$/
    suffix = "nd"
  when /^[0-9]*[3]$/
    suffix = "rd"
  else
    suffix = "th"
  end
  suffix
end

def days_before(dday, days) 
  date = dday - days
  DDay.new(date.year, date.month, date.day)
end

def days_after(dday, days) 
  date = dday + days
  DDay.new(date.year, date.month, date.day)
end

class DDay
  def initialize(year, month, day)
    @dday = Date.new(year, month, day)
    self.set_today
    self.set_days_to_go
    self.set_hundreds  
  end
  
  def print_thday(n)
    if passed?
      @thdays.push("#{n.ordinalize} #{days_after(@dday, n).date}")
    else
      @thdays.push("D-#{n} #{days_before(@dday, n).date}")
    end
  end
  
  def items(x)
    if x > 1
      @n = @n / (10 ** (x-1)) * (10 ** (x-1))
      until @n <=(10 ** (x-1)) do
        print_thday(@n)
        @n -= (10 ** (x-1))
      end
      print_thday(@n)
    end
  end
  
  def power(x)
    items(x)
    items(x-1)
  end
  
  def thdays
    @thdays = []
    @n = days_to_go.abs
    x = @n.to_s.length
    power(x)    
    @thdays.uniq
  end

  def set_today
    t = Time.now
    y = t.year
    m = t.month
    d = t.day
    @today = Date.new(y, m, d)
  end
  
  def set_days_to_go
    @days_to_go = (@today - @dday).to_i
    if self.passed?
      @days_to_go = @days_to_go + 1
    end
  end
  
  def set_hundreds
    @hundreds = (@days_to_go.abs/100)
  end
  
  def nth(n)
    passed? ? days_after(@dday, n) : days_before(@dday, n)
  end
  
  def other_nth(n)
    passed? ? days_before(@dday, n) : days_after(@dday, n)
  end
  
  def date
    "#{@dday.year}/#{@dday.month}/#{@dday.day}"
  end
  
  def hundreds
    @hundreds
  end
  
  def dday
    @dday
  end
  
  def passed?
    @days_to_go >= 0
  end
  
  def template
    passed? ? :passed : :coming
  end
  
  def days_to_go
    @days_to_go
  end
  
  def year
    @dday.year
  end

  def month
    @dday.month
  end

  def day
    @dday.day
  end
end