class Space
  attr_reader :x, :y, :living_neighbors

  def initialize(x_coord, y_coord)
    @x = x_coord
    @y = y_coord
    @is_alive = false
  end

  def is_alive?
    @is_alive
  end

  def give_life
    @is_alive = true
  end

  def kill
    @is_alive = false
  end

  def is_neighbor_alive?
    @living_neighbors = []

    for space in Board.all
      if space.is_alive? == true && space != self
        if space.x == self.x + 1 || self.x - 1 || self.x
          @living_neighbors << space
        elsif space.y == self.y + 1 || self.y - 1
          @living_neighbors << space
        end
      end
    end
    @living_neighbors.length
    #loop through entire array
    #count only cells with x + or -1 or y + or -1
  end

  def underpopulation?
    if is_neighbor_alive? <= 1
      self.kill
    end
  end

  def overpopulation?
    if is_neighbor_alive? > 3
      self.kill
    end
  end

  def necromancy
    if is_neighbor_alive? == 3
      self.give_life
    end
  end

end


#(5, 6)

#array is from .all[0] (1, 1) to .all[99] (10, 10)

#when we create a board, we need to set all spaces to false except ones we're using to seed the board
#bathroom break
#so how do we keep track of time? how do we increment a cycle? and what happens during a cycle?

#during a turn, run is_neighbor_alive on each cell
#apply rule to self based on game rules

#figure out a way to update

