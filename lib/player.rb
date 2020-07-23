require 'pry'

class Player
  attr_accessor :name, :mark
  def initialize(name_to_save, mark_to_save)
    @name = name_to_save
    @mark = mark_to_save
  end
end
