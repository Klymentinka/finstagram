=begin
- Write a method that accepts a 10 character string of letters (both uppercase and lowercase)
- if not 10 characters in length, return false
- else:
  - define empty string variable (phone_number)
  - convert string into an array
  - loop through array
  - compare each letter in the array to telephone mappings and concat or add to variable (phone_number)
  - return the variable (phone_number)

* You may need to ensure the letter casing of the input string *
=end

# def yellowpager(tencharstring)
#   if tencharstring.length != 10
#     'Please enter 10 characters'
#   else
#     phone_number = ''
#     tencharstring.downcase.split('').each do | letter |
#       if letter == 'a' || letter == 'b' || letter == 'c'
#         phone_number += '2'
#       elsif letter == 'd' || letter == 'e' || letter == 'f'
#         phone_number += '3'
#       elsif letter == 'g' || letter == 'h' || letter == 'i'
#         phone_number += '4'
#       elsif letter == 'j' || letter == 'k' || letter == 'l'
#         phone_number += '5'
#       elsif letter == 'm' || letter == 'n' || letter == 'o'
#         phone_number += '6'
#       elsif letter == 'p' || letter == 'q' || letter == 'r' || letter == 's'
#         phone_number += '7'
#       elsif letter == 't' || letter == 'u' || letter == 'v'
#         phone_number += '8'
#       else
#         phone_number += '9'
#       end
#     end 
#     phone_number
#   end
# end

## ALONA's SOLUTION

def yellowpager(tencharstring)
  mapping = {"A" => "2", "B" => "2","C" => "2", 
  "D" => "3", "E" => "3", "F" => "3",
  "G" => "4", "H" => "4", "I" => "4",
  "J" => "5", "K" => "5", "L" => "5",
  "M" => "6", "N" => "6", "O" => "6",
  "P" => "7", "Q" => "7", "R" => "7", "S" => "7",
  "T" => "8","U" => "8", "V" => "8",
  "W" => "9","X" => "9","Y" => "9","Z" => "9"}

  if tencharstring.length != 10
    'Please enter 10 characters'
  else
    phone_number = ''
    tencharstring.upcase.split('').each do | letter |
      if mapping.key?(letter)
        phone_number += mapping[letter]
      else
        phone_number += letter
      end
    end
    phone_number
  end
end


# call method here (you may need to print the return value)

p yellowpager('lighthouse')
p yellowpager('bananas')
p yellowpager('LIGHTHOUSE')
p yellowpager('LIGHTHOUS9')
