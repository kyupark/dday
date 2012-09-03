def print_hundredth(n, x, y)
  n_to_the_x(n, x)
  until n <= 10 ** x do
    puts "li"
    print_dday(n)
    n -= 10 ** x
  end
  n_to_the_x(n, y)
  until n <= 0 do
    puts "li"
    print_dday(n)
    n -= 10 ** y
  end
end

def print_dday(n)
  "D-#{n} #{@d.nth(n).date}"
end

def n_to_the_x(n, x)
  n = n / (10 ** x) * (10 ** x)
  n -= (10 ** 3)
end