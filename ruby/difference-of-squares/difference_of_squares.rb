# frozen_string_literal: true

# class Squares
class Squares
  def initialize(int)
    @i = int
  end

  def square_of_sum
    sqos = 0
    (1..@i).each { |x| sqos += x }
    sqos**2
  end

  def sum_of_squares
    sosq = 0
    (1..@i).each { |x| sosq += x**2 }
    sosq
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
