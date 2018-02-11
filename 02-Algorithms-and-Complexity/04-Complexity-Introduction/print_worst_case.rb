def print_worst_case(n)
  puts "collection size n || # of iterations in worst case"
  1.upto(n) do |i|
    puts "#{i}                    #{i}"

  end
end

print_worst_case(10)
