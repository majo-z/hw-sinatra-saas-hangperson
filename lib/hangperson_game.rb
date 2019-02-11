class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

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
    # disable case-sensitivity
    

    # alphabetic characters, or /[[^alpha]]/
    # raise ArgumentError when not a letter, empty, or nil
    raise ArgumentError if (letter.empty? || letter.nil? || letter =~ /[[^a-zA-Z]]/)

    letter.downcase!
     
    # check if a letter has already been guessed
    if (@guesses.include? letter) || (@wrong_guesses.include? letter)
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
  end

  def word_with_guesses
    banana = ''
    @word.split('').each do |letter|
      if(@guesses.include? letter)
        banana << letter
      else
        banana << '-'
      end
    end
    return banana
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

  

end
