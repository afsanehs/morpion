class BoardCase
  attr_accessor :state
  def initialize
    @state = "default-#{rand}"
  end
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
  def played?
    !(@state =~ /default/)
  end
  def take(mark)
    @state = mark
  end
end
