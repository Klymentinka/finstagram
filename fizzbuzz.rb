arr = [*1..100]

for item in arr
    line = ""
    
    if item % 3 == 0
        line = line + "Fizz"
    end
    
    if item % 5 == 0
        line = line + "Buzz"
    end

    if line == ""
        line = item
    end

    p line
end
