require 'pry'

class Game
  def initialize
    @game_count = 0
    initialize_state
  end

  # key & value are the same, do that it displays the one that don't have a move yet (state of the board)
  def initialize_state
    @board = Board.new
    @winner = false
    @board_full = false
    @game_count += 1
  end

  # ask the names of player 1 & player 2
  def intro
    puts "Player X: what's your name?".green
    @player1 = Player.new(gets.strip, 'X')
    puts "Player O: what's your name?".green
    @player2 = Player.new(gets.strip, 'O')
  end

  # keeps asking player1, player2 to play until there is a winner
  def play
    puts "Game n°#{@game_count}".red
    loop do
      ask_x
      break if in_end_state

      ask_o
      break if in_end_state
    end
    puts 'there is a winner!'.pink if @winner
    puts 'le tableau est rempli !'.blue if @board_full
    @board.print
    offer_play
  end

  def in_end_state
    @winner = @board.winner
    @board_full = @board.full
    @winner || @board_full
  end

  # offers to play again
  def offer_play
    puts 'Voulez-vous jouer encore une partie ?'.green
    response = gets.strip
    response = response.upcase
    if 'OUI' == response
      initialize_state
      play
    end
  end

  # ask player what they want to do
  def ask_square(player)
    puts "#{player.name} quelle case souhaites-tu cocher ?".green
    @board.print
    response = gets.strip
    response = response.upcase
    row = response[0]
    column = response[1].to_i
    # if the players puts a wrong value
    if !@board.valid_value?(row, column)
      puts 'mauvaise réponse !'.yellow
      return
    end
    # if the player choose a full square
    if @board.case_occupied?(row, column)
      puts 'case déjà prise !'
      return
    end
    return row, column
  end

  # fill the square
  def ask_x
    row, column = ask_square @player1
    return unless row && column
    @board.make_move(row, column, @player1.mark)
  end

  # fill the square
  def ask_o
    row, column = ask_square @player2
    return unless row && column
    @board.make_move(row, column, @player2.mark)
  end
end
