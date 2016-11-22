class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { Array.new }
    @cups.each_index do |idx|
      if idx != 6 && idx != 13
        place_stones(idx)
      end
    end
  end

  def place_stones(idx)
    # helper method to #initialize every non-store cup with four stones each
    4.times { @cups[idx].push(:stone) }
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 12 || start_pos < 1
  end

  def make_move(start_pos, current_player_name)
    stones_left = cups[start_pos].length
    cups[start_pos] = []
    current_idx = start_pos + 1

    until stones_left == 0
      if current_idx == 6 && current_player_name == @player1
        @cups[current_idx] << :stone
      elsif current_idx == 13 && current_player_name == @player2
        @cups[current_idx] << :stone
      else
        @cups[current_idx] << :stone
      end

      stones_left -= 1
      if current_idx == 13
        current_idx = 0
      else
        current_idx += 1
      end
    end

    render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
