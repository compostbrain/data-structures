def fib(n)
  if (n == 0)
   # #1
    return 0
  elsif (n == 1)
    # #2
    return 1
  else
   # #3
    return fib(n-1) + fib(n-2)
  end
end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
puts fib(10)
puts fib(11)
puts fib(12)
