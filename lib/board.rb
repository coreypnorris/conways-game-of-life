class Board
  attr_reader :spaces

  @@spaces = []

  def initialize(number)
    self.create(number)
  end

  def create(number)
    i = 1
    j = 1

     for i in 1..number # makes x coord,   x = 1 ...   2  ...   3  ...  4
      for j in 1..number # makes y coord,  y = 1-10 ... 1-10 ... 1-10 .. 1-10
        @@spaces << Space.new(i, j)
      end
    end
  end

  def Board.all
    @@spaces
  end

  def Board.clear
    @@spaces = []
  end
end

# test_board.all[45].is_neighbor_alive?.should eq 2
# test_board.all[45].is_alive?.should eq true

#what is different? one works and the other doesn't
