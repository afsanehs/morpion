class Board
  def initialize
    @cases= {
      "A" => [nil, BoardCase.new, BoardCase.new, BoardCase.new],
      "B" => [nil, BoardCase.new, BoardCase.new, BoardCase.new],
      "C" => [nil, BoardCase.new, BoardCase.new, BoardCase.new]
    }
  end

  #display empty board
  def print
    puts <<~TEXT
       1 2 3
      -------
    A |#{@cases["A"][1].print_state}|#{@cases["A"][2].print_state}|#{@cases["A"][3].print_state}|
      -------
    B |#{@cases["B"][1].print_state}|#{@cases["B"][2].print_state}|#{@cases["B"][3].print_state}|
      -------
    C |#{@cases["C"][1].print_state}|#{@cases["C"][2].print_state}|#{@cases["C"][3].print_state}|
      -------
    TEXT
  end

  #checks if the row & column entered refer to a case in the board 
  def valid_value?(row, column)
    return false unless %w[A B C].include?(row)
    return false unless [1,2,3].include?(column)
    true
  end

  #checks if a case has already been played 
  def case_occupied?(row, column)
    @cases[row][column].played?
  end

  #checks if the board is full
  def full
    @cases.each do |row, columns|
      columns.compact.each do |c|
        return false unless c.played?
      end
    end
    return true
  end

  #algorithm that defines if there is a winner
  def winner
    (@cases['A'][1].state == @cases['A'][2].state && @cases['A'][2].state == @cases['A'][3].state) ||
    (@cases['B'][1].state == @cases['B'][2].state && @cases['B'][2].state == @cases['B'][3].state) ||
    (@cases['C'][1].state == @cases['C'][2].state && @cases['C'][2].state == @cases['C'][3].state) ||
    (@cases['A'][1].state == @cases['B'][1].state && @cases['B'][1].state == @cases['C'][1].state) ||
    (@cases['A'][2].state == @cases['B'][2].state && @cases['B'][2].state == @cases['C'][2].state) ||
    (@cases['A'][3].state == @cases['B'][3].state && @cases['B'][3].state == @cases['C'][3].state) ||
    (@cases['A'][1].state == @cases['B'][2].state && @cases['B'][2].state == @cases['C'][3].state) ||
    (@cases['A'][3].state == @cases['B'][2].state && @cases['B'][2].state == @cases['C'][1].state)
  end

  #puts the players mark on a case
  def make_move(row, column, mark)
    @cases[row][column].take(mark)
  end

end
