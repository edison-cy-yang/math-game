require './question'
require './game'
require './player'

##random generate all the questions
question1 = Question.new("1+1", 2)
question2 = Question.new("2+3", 5)
question3 = Question.new("5 * 11", 55)
question4 = Question.new("20 / 10", 2)
question5 = Question.new("2 * 15", 30)

player1 = Player.new("edi", 3)
player2 = Player.new("John", 3)

game = Game.new(player1, player2)

game.add_question(question1)
game.add_question(question2)
game.add_question(question3)
game.add_question(question4)
game.add_question(question5)

game.play

puts game.inspect