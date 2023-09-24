dictionary = File.read('google-10000-english-no-swears.txt').split
#print dictionary

words = dictionary.select { |word| word.length >= 5 && word.length <= 12 }
#print words
#puts "Dictionary length: #{dictionary.length}, Words length: #{words.length}"
word = words.sample
puts word