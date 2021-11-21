$number = {A: 2, B: 2,C: 2, 
D: 3, E: 3, F: 3,
G: 4, H: 4, I: 4,
J: 5, K: 5, L: 5,
M: 6, N: 6, O: 6,
P: 7, Q: 7, R: 7, S: 7,
T: 8,U: 8, V: 8,
W: 9,X: 9,Y: 9, Z:9}


def translate(letters)
    letters = letters.strip.upcase
    if letters.length != 10
        puts 'Please enter 10 characters'
        return false
    else 
        phone = ''
        letters.split('').each do |i|
            # puts i.to_sym
            if $number.key?(i.to_sym)
                phone += $number[i.to_sym].to_s
            else
                phone += i
            end
        end
        return phone
    end
end

puts 'Enter 10-character string of letters '
letters = gets
result = translate(letters)
puts result
