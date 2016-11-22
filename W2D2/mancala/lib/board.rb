require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
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
    stones_left = @cups[start_pos]
    @cups[start_pos] = []
    current_idx = start_pos
    until stones_left.empty?
      current_idx += 1
      current_idx = 0 if current_idx > 13
      if current_idx == 6
        @cups[6] << stones_left.pop if current_player_name == @name1
      elsif current_idx == 13
        @cups[13] << stones_left.pop if current_player_name == @name2
      else
        @cups[current_idx] << stones_left.pop
      end
    end

    render
    next_turn(current_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups.take(6).all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end
