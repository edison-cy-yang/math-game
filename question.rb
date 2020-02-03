class Question
  attr_accessor :description

  def initialize(description, answer)
    @description = description
    @answer = answer
  end

  def check_answer(player_answer)
    @answer == player_answer
  end

end