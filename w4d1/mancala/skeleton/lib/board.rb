class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...@cups.length).each do |i|
      if i != 6 && i != 13
        4.times do 
          @cups[i] << :stone 
        end
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12
      raise "Invalid starting cup"
    end
    if @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  #     12  11  10   9  8  7
  # [13]                    [6]
  #      0   1   2   3  4  5  
  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    while !stones.empty?
      # start_pos = (start_pos % 13) + 1
      start_pos += 1
      if start_pos > 13
        start_pos = 0
      end
      if start_pos == 6
        @cups[start_pos] << stones.pop if @name1 == current_player_name
      elsif start_pos == 13
        @cups[start_pos] << stones.pop if @name2 == current_player_name
      else
        @cups[start_pos] << stones.pop
      end
    end
    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1 
      return :switch
    else
      return ending_cup_idx
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
    @cups[0..6].all? {|row| row.empty?} || @cups[7..12].all? {|row| row.empty?}
  end

  def winner
    if @cups[6].length > @cups[13].length
      return @name1
    elsif @cups[6].length == @cups[13].length
      return :draw
    else
      return @name2
    end
  end
end
