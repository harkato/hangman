class Game
  attr_reader :word, :right_index, :wrong_guess

  MAX_ATTEMPTS = 10

  def initialize
    @word = select_word
    @attempts = 0
  end

  def select_word
    dictionary = File.read('google-10000-english-no-swears.txt').split
    words = dictionary.select { |word| word.length >= 5 && word.length <= 12 }
    words.sample
  end

  def guesses
    @right_guess = '_ ' * @word.length
    @wrong_guess = []
  end

  def player_guess
    @attempts += 1
    @user_input = gets.chomp.downcase
    until ('a'..'z').include?(@user_input)
      puts 'Please enter a valid letter'
      @user_input = gets.chomp.downcase
    end
    @user_input
  end

  def check_index
    letters = @word.split('')
    right_index = nil
    letters.each_with_index do |letter, index|
      if letter == @user_input
        right_index = index
      end
    end
    if right_index.nil?
      @wrong_guess < @user_input
    else 
      @right_guess[right_index * 2] = @user_input
      @right_guess
    end
  end
end

newgame = Game.new
puts newgame.word
puts newgame.player_guess
puts newgame.check_index