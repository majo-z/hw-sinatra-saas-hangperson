class HangpersonGame

  # define getters & setters
  attr_accessor :word, :guesses, :wrong_guesses

  #initialize object
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  # instance methods of the game class

  def guess(letter)
    # raise ArgumentError when not a letter, empty, or nil
    raise ArgumentError if (letter.to_s == '') || 
    (letter.nil?) || 
    (letter =~ /[[^a-zA-Z]]/) # alphabetic characters, or /[[^alpha]]/

    # disable case-sensitivity
    letter.downcase!
    
    # check if a letter has already been guessed
    if (@guesses.include? letter) || 
      (@wrong_guesses.include? letter)
      return false 
    else
      if @word.include? letter
        @guesses << letter
      else
        @wrong_guesses << letter
      end
    end 
  end # def guess

  def check_win_or_lose
    if self.word_with_guesses == @word
      return :win
    elsif @wrong_guesses.length == 7
      return :lose
    else
      return :play
    end
  end

  def word_with_guesses
    chars = ''
    @word.split('').each do |letter| # @word.each_char do |letter|
      if(@guesses.include? letter)
        chars << letter # chars += letter
      else
        chars << '-'
      end
    end
    return chars
  end

  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

end #class HangpersonGame
