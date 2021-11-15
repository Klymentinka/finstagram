arr = [*1..100]

for item in arr
    
    # print_flag = false
    # if item % 3 == 0
    #     print "Fizz"
    #     print_flag = true
    # end
    
    # if item % 5 == 0
    #     print "Buzz"
    #     print_flag = true
    # end

    # if print_flag == false
    #     print item
    # end
    # puts ''



    # if item % 3 == 0 && item % 5 == 0
    #     puts "FizzBuzz"
    # elsif item % 3 == 0
    #     puts "Fizz"
    # elsif item % 5 == 0
    #     puts "Buzz"
    # else
    #     puts item
    # end
    

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

    puts line
end
