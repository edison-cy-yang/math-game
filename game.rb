class Game
  attr_accessor :questions, :player1, :player2, :current_player, :current_question

  def initialize(player1, player2)
    @questions = []
    @player1 = player1
    @player2 = player2
    @current_player = self.player1
    @current_question = 0
  end

  def add_question(question) 
    @questions << question
  end

  def switch_player
    if self.current_player == self.player1
      self.current_player = self.player2
    else
      self.current_player = self.player1
    end
  end

  def current_score
    "player 1: #{self.player1.name} #{self.player1.lives}/#{self.player1.total_lives} vs player 2: #{self.player2.name} #{self.player2.lives}/#{self.player2.total_lives}"
  end

  def game_over
    self.player1.lives <= 0 || self.player2.lives < 0 || self.current_question >= self.questions.length
  end

  def next_round
    self.current_question += 1
    self.switch_player
  end

  def winner
    if player1.lives > player2.lives
      "winner is #{player1.name}!"
    elsif player2.lives > player1.lives
      "winner is #{player2.name}!"
    else
      "It's a tie!"
    end
  end

  def play
    while !self.game_over do 
      self.play_turn
    end  
    puts self.winner
  end

  def play_turn
    puts "#{self.current_player.name}, #{self.questions[self.current_question].description} = ?"
    player_answer = gets.chomp.to_i
    if self.questions[self.current_question].check_answer(player_answer)
      puts "correct answer!"
    else
      puts "wrong answer!"
      self.current_player.deduct_life ##use a method for deducting lives
    end
    puts self.current_score  ##display scores for two players after current round
    # self.switch_player ##switch the player
    self.next_round ##tell the game to advance to next round
  end
end