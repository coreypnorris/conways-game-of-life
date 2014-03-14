require 'rspec'
require 'board'
require 'space'
require 'game'

describe "Game" do
  before do
    Board.clear
  end

  describe 'initialize' do
    it 'initializes a new game' do
      test_game = Game.new(0)
      test_game.should be_an_instance_of Game
    end
  end

  describe 'genesis' do
    it 'applies the 4 steps to every space' do
      test_game = Game.new(10)
      Board.all[44].give_life
      Board.all[46].give_life
      Board.all[55].give_life
      Board.all[45].necromancy
      test_game.genesis
      Board.all[45].is_alive?.should eq true
      Board.all[99].is_alive?.should eq false
      test_game.cycles.should eq 1
    end
  end
end

describe "Board" do
  before do
    Board.clear
  end

  describe "initialize" do
    it "initializes a board" do
    test_board = Board.new(0)
    test_board.should be_an_instance_of Board
    end
  end


  describe 'create' do
    it 'creates a new instance of a board object' do
      test_board = Board.new(10)
      Board.all.length.should eq 100
    end
  end
end

describe "Space" do
  before do
    Board.clear
  end

  describe 'is_alive?' do
    it "returns a cell's live or dead status" do
    test_board = Board.new(10)
    Board.all[0].is_alive?.should eq false
    end
  end

  describe 'give_life' do
    it "sets a cell's status to alive" do
      test_board = Board.new(10)
      Board.all[45].give_life
      Board.all[45].is_alive?.should eq true
    end
  end

  describe 'is_neighbor_alive?' do
    it 'checks all the neighbors' do
      test_board = Board.new(10)
      Board.all[44].give_life
      Board.all[45].give_life
      Board.all[46].give_life
      Board.all[45].is_neighbor_alive?.should eq 2
    end
  end

  describe 'underpopulation?' do
    it 'sets a living cell to dead if it has less than two live neighbors' do
      test_board = Board.new(10)
      Board.all[45].give_life
      Board.all[46].give_life
      Board.all[45].underpopulation?
      Board.all[45].is_alive?.should eq false
    end
  end

  describe 'overpopulation?' do
    it 'sets a living cell to dead if it has more than three live neighbors' do
      test_board = Board.new(10)
      Board.all[44].give_life
      Board.all[45].give_life
      Board.all[46].give_life
      Board.all[55].give_life
      Board.all[56].give_life
      Board.all[45].overpopulation?
      Board.all[45].is_alive?.should eq false
    end
  end

  describe 'necromancy' do
    it 'sets a dead cell to living if it has exactly three live neighbors' do
    test_board = Board.new(10)
    Board.all[44].give_life
    Board.all[46].give_life
    Board.all[55].give_life
    Board.all[45].necromancy
    Board.all[45].is_alive?.should eq true
    end
  end
end
