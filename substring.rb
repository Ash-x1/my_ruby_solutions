def substring
  dictionary = [
    "an", "is", "of", "to", "at", "by", "up", "so", "go", "me",
    "the", "and", "for", "but", "not", "you", "all", "get", "new", "say",
    "may", "can", "out", "now", "see", "two", "one", "him", "her", "had",
    "time", "year", "work", "life", "back", "call", "just", "then", "like", "into"
  ].map(&:downcase)

  puts "Enter your text:"
  user_input = gets.chomp.downcase
  
  input_words = user_input.scan(/\w+/)

  repetition_counts = dictionary.each_with_object({}) do |dict_word, results|
    
    count = input_words.count { |input_word| input_word.include?(dict_word) }
    
    if count > 0
      results[dict_word] = count
    end
  end
  
  puts "The repitition time was: #{repetition_counts}"
  
  return repetition_counts
end

substring