require 'bundler'
Bundler.require

require_relative 'lib/string_colors'
require_relative 'lib/game'
require_relative 'lib/board_case'
require_relative 'lib/board'
require_relative 'lib/player'

game = Game.new

game.intro

game.play
