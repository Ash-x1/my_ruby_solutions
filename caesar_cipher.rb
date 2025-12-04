def caesar_cipher(input_string, shift_amount)
  shift_amount %= 26 
  lowercase_alphabet = ('a'..'z').to_a
  uppercase_alphabet = ('A'..'Z').to_a
  result = ""
  
  input_string.each_char do |char|
    if lowercase_alphabet.include?(char)
      
      old_index = lowercase_alphabet.index(char)
      new_index = (old_index + shift_amount) % 26
      result << lowercase_alphabet[new_index]
      
    elsif uppercase_alphabet.include?(char)
      
      old_index = uppercase_alphabet.index(char)
      new_index = (old_index + shift_amount) % 26
      result << uppercase_alphabet[new_index]
      
    else 
      result << char
    end
  end
  
  return result
end


puts "Enter the message here:"
message = gets.chomp

puts "Enter shift factor here:"
shift = gets.chomp.to_i

encrypted_message = caesar_cipher(message, shift)
puts "Your encypted message: \n #{encrypted_message}"

