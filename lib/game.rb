class Game
  attr_reader :cycle

  @@cycle = 0

  def initialize(spaces)
    new_board = Board.new(spaces)
    new_board
  end

  def cycles
    @@cycle
  end

  def genesis()
    Board.all.each do |space|
      space.underpopulation?
      space.overpopulation?
      space.necromancy
    end
    @@cycle += 1
  end
end
