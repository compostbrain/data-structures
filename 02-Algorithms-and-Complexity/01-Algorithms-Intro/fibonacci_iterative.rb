
# DEF FIB(n)
def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  counter = 0
  fib_0 = 0 #   SET fib_0 to 0
  fib_1 = 1 #   SET fib_1 to 1
  while counter < n #   FOR each value from 0 to one less than n
    temp = fib_0 #    SET temp to fib_0
    fib_0 = fib_1 #     ASSIGN fib_1 to fib_0
    fib_1 = temp + fib_1 #     COMPUTE temp + fib_1, ASSIGN to fib_1
    counter += 1
  end #   END FOR
  return fib_1 #   RETURN fib_1
end # END DEF

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
