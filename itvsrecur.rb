
def sum_to_n(n)
    total = 0
    for i in 1..n do
        total= total + i
    end
    return total
end

def sum_to_n_r(n)
    if n==1
        return 1
    else 
        puts "current n #{n}"
        return n + sum_to_n_r(n-1)
    end
end

puts "something"
sum_to_n(4)