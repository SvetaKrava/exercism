# frozen_string_literal: true

# class Queens
class Queens
  def initialize(queen)
    queen.each_value do |coord|
      raise ArgumentError unless coord.all? { |c| c.between?(0, 7) }
    end
    @board = queen
  end

  def attack?
    (0..1).each { |i| return true if @board[:white][i] == @board[:black][i] }
    return true if (@board[:white][0] - @board[:black][0]).abs == (@board[:white][1] - @board[:black][1]).abs

    false
  end
end
