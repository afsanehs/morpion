class BoardCase
  attr_accessor :state
  #initialize the state with a random string, starting with a known string
  #it was done this way to make it easier to do the winner check without having to also check everything for nil 
  def initialize
    @state = "default-#{rand}"
  end
  #provides a textual, colorized representation of the case's state
  def print_state
    case @state
    when "X"
      "X".red
    when "O"
      "O".blue
    else
      " "
    end
  end
  #returns a boolean indicating if the case has already been played 
  def played?
    !(@state =~ /default/)
  end
  #mark the case with x or o
  def take(mark)
    @state = mark
  end
end
