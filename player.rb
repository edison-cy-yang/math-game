class Player
  attr_accessor :name, :lives, :total_lives

  def initialize(name, total_lives)
    @name = name
    @total_lives = total_lives
    @lives = total_lives
  end

  def deduct_life
    self.lives -= 1
  end
end