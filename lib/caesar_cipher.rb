#!/usr/bin/env ruby

class CaesarCipher
  def initialize(input_string, shift_amount)
    @input_string = input_string
    @shift_amount = shift_amount % 26
    @lowercase = ('a'..'z').to_a
    @uppercase = ('A'..'Z').to_a
  end

  def encrypt
    result = ''

    @input_string.each_char do |char|
      if @lowercase.include?(char)
        index = @lowercase.index(char)
        result << @lowercase[(index + @shift_amount) % 26]

      elsif @uppercase.include?(char)
        index = @uppercase.index(char)
        result << @uppercase[(index + @shift_amount) % 26]

      else
        result << char
      end
    end

    result
  end
end

# puts 'Enter the message:'
# message = gets.chomp

# puts 'Enter shift factor:'
# shift = gets.chomp.to_i

# cipher = CaesarCipher.new(message, shift)
# puts "Encrypted message:"
# puts cipher.encrypt



# def caesar_cipher(input_string, shift_amount)
#   shift_amount %= 26
#   lowercase_alphabet = ('a'..'z').to_a
#   uppercase_alphabet = ('A'..'Z').to_a
#   result = ''
#
#   input_string.each_char do |char|
#     if lowercase_alphabet.include?(char)
#
#       old_index = lowercase_alphabet.index(char)
#       new_index = (old_index + shift_amount) % 26
#       result << lowercase_alphabet[new_index]
#
#     elsif uppercase_alphabet.include?(char)
#
#       old_index = uppercase_alphabet.index(char)
#       new_index = (old_index + shift_amount) % 26
#       result << uppercase_alphabet[new_index]
#
#     else
#       result << char
#     end
#   end
#
#   result
# end
#
# puts 'Enter the message here:'
# message = gets.chomp
#
# puts 'Enter shift factor here:'
# shift = gets.chomp.to_i
#
# encrypted_message = caesar_cipher(message, shift)
# puts "Your encypted message: \n #{encrypted_message}"
