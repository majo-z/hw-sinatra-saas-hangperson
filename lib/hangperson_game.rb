class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # define getters & setters
  attr_accessor :word, :guesses, :wrong_guesses

  #initialize object
  def initialize(word)
    @word = word
    @guesses = ""
    @wrong_guesses = ""
  end

  # instance methods of the game class

  def guess
  end

  def check_win_or_lose
  end

  def word_with_guesses
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
